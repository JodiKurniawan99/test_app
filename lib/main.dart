import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/commons/styles.dart';
import 'package:test_app/screens/first_screen.dart';
import 'package:test_app/screens/second_screen.dart';
import 'package:test_app/screens/third_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white,elevation: 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: const Color(0xFF2B637B),
        scaffoldBackgroundColor: Colors.white,
        
       
        textTheme: myTextTheme,   
      ),
      initialRoute: FirstScreen.routeId,
      routes: {
        FirstScreen.routeId: (context) => FirstScreen(),
        SecondScreen.routeId: (context) => SecondScreen(
              ModalRoute.of(context)?.settings.arguments as String),
        ThirdScreen.routeId: (context) => ThirdScreen(),
        
      },
    );
  }
}

