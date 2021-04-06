import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vigila/main.dart';
import 'package:vigila/screens/authenticate/authenticate.dart';
import 'package:vigila/models/user.dart';
import 'package:vigila/screens/home/home.dart';
import 'package:vigila/screens/splash/loginsplashscreen.dart';
import 'package:vigila/screens/splash/registersplashscreen.dart';

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
      return Authenticate(toggleNewUser: toggleNewUser);
    } else {
      if (!newUser) {
        Future.delayed(Duration.zero, () {
          Navigator.push(context, MaterialPageRoute(
                builder: (context) => LoginSplashScreen(),
              ));
        });
        return MyNavigationBar();
      } else {
        Future.delayed(Duration.zero, () {
          Navigator.push(context, MaterialPageRoute(
                builder: (context) => RegisterSplashScreen(),
              ));
        });
        return MyNavigationBar();
      }
      // return MyNavigationBar();
    }
  }
}
