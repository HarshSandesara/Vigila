import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginSplashScreen extends StatefulWidget {
  @override
  _LoginSplashScreen createState() => _LoginSplashScreen();
}

class _LoginSplashScreen extends State<LoginSplashScreen> {
  // Splash screen to prompt users to update information and read guidelines
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => Navigator.of(context).pop());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage("lib/images/guidelines.png"),
                        height: 150,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SpinKitChasingDots(
                      color: Colors.lightBlue.shade500,
                      size: 45.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "Remember to keep yourself updated\nwith the latest guidelines",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Go to the guidelines tab inside\nthe app to find the latest guidelines",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.0, color: Colors.grey.shade800),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
