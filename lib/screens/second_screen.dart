import 'package:flutter/material.dart';
import 'package:test_app/screens/third_screen.dart';

class SecondScreen extends StatefulWidget {
  static const String routeId = 'second_screen';
  final String data;
  const SecondScreen(this.data);
  @override
  _SecondScreenState createState() => _SecondScreenState();
}
class _SecondScreenState extends State<SecondScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'Second Screen',
            style: TextStyle(
            color: Colors.black
          ), 
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      body: Column(
        children: <Widget>[
           Padding(
              padding: EdgeInsets.only(top: 16, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Welcome"),
                  Text(
                    widget.data,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 230,),

                  Center(
                    child: Text(
                      'Selected User Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold

                      ),
                    ),
                  ),
                  
                ],
              ),
            ),   
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.only(bottom: 16,left: 16,right: 16),
          child: MaterialButton(
                      child: Text('Choose a User'),
                      color: Theme.of(context).primaryColor,
                      textTheme: ButtonTextTheme.primary,
                      height: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, ThirdScreen.routeId);
                      }
                    ),
        )
      ),
      
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
