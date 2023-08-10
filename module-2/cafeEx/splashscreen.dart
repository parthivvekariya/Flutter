import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'firstpage.dart';

class SplashScreen extends StatefulWidget
{
  @override
  SplashState createState() => SplashState();

}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 5),
          () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Firstpage()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(width: 300, height: 300,),
            Lottie.network(
              "https://roasting-conflict.000webhostapp.com/lotti/cafe.json",
              height: 200.0,
              repeat: true,
              reverse: true,
              animate: true,
            ),
          ],
        ),
      ),
    );
  }
}