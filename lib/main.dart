import 'dart:async';
import 'groupScreen.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'login.dart';

/*
      Für das Icon: https://github.com/franzsilva/flutter_launcher_icons
      flutter pub get
      flutter pub pub run flutter_launcher_icons:main


*/

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new Login()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('assets/images/G7-Weltkugel.png'),
        
      ),
    );
  }
}


