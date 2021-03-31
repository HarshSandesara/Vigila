import 'package:flutter/material.dart';
import 'package:vigila/screens/authenticate/register.dart';
import 'package:vigila/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  // final Function toggleNewUser;
  // Authenticate({this.toggleNewUser});

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      // widget.toggleNewUser();
      return SignIn(toggleView: toggleView);
    } else {
      // widget.toggleNewUser();
      return Register(toggleView: toggleView);
    }
  }
}
