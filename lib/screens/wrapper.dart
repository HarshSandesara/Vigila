import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vigila/screens/authenticate/authenticate.dart';
import 'package:vigila/screens/home/home.dart';
import 'package:vigila/models/user.dart';
import 'package:vigila/screens/splash/loginsplashscreen.dart';
import 'package:vigila/screens/splash/registersplashscreen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return RegisterSplashScreen();
    }
  }
}
