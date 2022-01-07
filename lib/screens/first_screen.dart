import 'package:flutter/material.dart';
import 'package:test_app/commons/styles.dart';
import 'package:test_app/screens/second_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class FirstScreen extends StatefulWidget{
  static const String routeId = 'first_screen';

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _nameController = TextEditingController();
  final _palindromeController = TextEditingController();

  bool _obscureText = true;
  bool _isTrue = true;

  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/background.png"),
      fit: BoxFit.cover,
    ),
  ),
  child:
  Scaffold(
    backgroundColor: Colors.transparent,
    body :Padding(

        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Image.asset(
              "assets/btn_add_photo .png",
              width: 100,
              height: 100),
            SizedBox(height: 24.0),
            TextField(
              controller: _nameController,
              autofocus: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 2, color: primary),
                    ),
                    focusColor: Color(0xFFf2f2f2),
                    border: OutlineInputBorder(),
                   
                    hintText: 'Name',
                    filled: true,

                    fillColor: Colors.white
                  ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _palindromeController,
               autofocus: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 2, color: primary),
                      ),
                      focusColor: Color(0xFFf2f2f2),
                      border: OutlineInputBorder(),
                      hintText: 'Palindrome',
                      filled: true,
                      fillColor: Colors.white),
            ),
            SizedBox(height: 24.0),
            MaterialButton(
              child: Text('Check'),
              color: Theme.of(context).primaryColor,
              textTheme: ButtonTextTheme.primary,
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.LEFTSLIDE,
                  headerAnimationLoop: false,
                  dialogType: isPalindrome(_palindromeController.text) ? DialogType.SUCCES: DialogType.ERROR,
                  showCloseIcon: true,
                  title: isPalindrome(_palindromeController.text)
                              ? 'IsPalindrome': 'not Palindrome',
                  btnOkOnPress: () {},
                  btnOkIcon: Icons.check_circle,
                  onDissmissCallback: (type) {
                    debugPrint('Dialog Dissmiss from callback $type');
                  }).show();       
              }
            ),

            MaterialButton(
                  child: Text('Next'),
                  color: Theme.of(context).primaryColor,
                  textTheme: ButtonTextTheme.primary,
                  height: 40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, SecondScreen.routeId,arguments: _nameController.text),
                ),
          ],
        ),
      ),
    )
      
    );
  }

  bool isPalindrome(String text){
    String reverse = text.split('').reversed.join('');
    if(text == reverse){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _palindromeController.dispose();
    super.dispose();
  }
}
