import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vigila/main.dart';
import 'package:vigila/screens/authenticate/authenticate.dart';
import 'package:vigila/models/user.dart';
import 'package:vigila/screens/home/home.dart';
import 'package:vigila/screens/home/login_splash_screen.dart';
import 'package:vigila/screens/home/register_splash_screen.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool newUser = true;
  void toggleNewUser() {
    setState(() => newUser = !newUser);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
        // toggleNewUser: toggleNewUser);
    } else {
      // if (!newUser) {
      //   return LoginSplashScreen();
      // } else {
      //   return RegisterSplashScreen();
      // }
      return MyNavigationBar();
    }
  }
}
