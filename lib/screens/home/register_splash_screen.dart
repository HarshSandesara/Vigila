import 'package:flutter/material.dart';

class RegisterSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Register Splash Screen"),
        backgroundColor: Colors.purple[700],
      ),
      body: Center(
        child: Text("Register Splash Screen"),
      ),
    );
  }
}