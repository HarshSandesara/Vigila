import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

class RegisterSplashScreen extends StatefulWidget {
  @override
  _RegisterSplashScreen createState() => _RegisterSplashScreen();
}

class _RegisterSplashScreen extends State<RegisterSplashScreen> {
  // Splash screen to prompt users to update information and read guidelines
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.of(context).pop());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: const Text('Vigila'),
      //     backgroundColor: Colors.purple[700],
      //     ),
      body: FadeIn(
              child: Stack(
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Image.network(
                          "https://image.flaticon.com/icons/png/512/504/504309.png",
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
                        color: Colors.yellow.shade600,
                        size: 45.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text(
                        "This is a safety application. It is intended to keep you safe. As such, the first thing you should do is fill your emergency contacts.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Go to the emergency tab inside\nthe app to add your emergency contacts.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.0, color: Colors.grey.shade800),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
