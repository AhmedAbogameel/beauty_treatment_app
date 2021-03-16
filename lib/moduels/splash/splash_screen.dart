import 'dart:async';

import 'package:beauty_treatment_app/constants.dart';
import 'package:beauty_treatment_app/moduels/home/homepage_screen.dart';
import 'package:beauty_treatment_app/moduels/intro/intro_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 3),()
    {
      Navigator.push(context, MaterialPageRoute(builder: (context) => currentLoggedUser.isLogged ? HomePageScreen() : introScreen(),));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
            height: double.infinity,
            child:Image.asset('assets/images/splash.png',fit: BoxFit.fill,)
        ),
      ),
    );
  }
}
