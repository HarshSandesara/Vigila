import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vigila/models/user.dart';
import 'package:vigila/screens/wrapper.dart';
import 'package:vigila/services/auth.dart';

class IntroLoginConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
      value: AuthService().user,
      child: Wrapper(),
    );
  }
}
