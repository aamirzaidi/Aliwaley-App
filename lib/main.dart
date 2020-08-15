import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Initial Screens/initial_screen.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyAppSplash());
}

class MyAppSplash extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SplashScreen(
              image: Image.asset('assets/logo.png'),
              loaderColor: Colors.black,
              seconds: 1,
              navigateAfterSeconds:MyApp(),
              title: new Text('Ali Waley',style: TextStyle(fontFamily: 'Merienda',fontSize: 32.0,fontWeight: FontWeight.bold),),
              backgroundColor: Colors.white,
              styleTextUnderTheLoader: new TextStyle(),
            ))
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: InitialScreen()),
      ),
    );
  }
}
