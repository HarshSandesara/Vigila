import 'package:flutter/material.dart';
import 'package:vigila/models/user.dart';
import 'package:vigila/services/auth.dart';

class Emergency extends StatelessWidget {
  // final AuthService _auth = AuthService();
  // CustomUser user;

  // _getCustomUser() {
  //   _auth.user.listen((customUser) {

  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your Emergency Contact List",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple[900],
                  fontWeight: FontWeight.w800),
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.person, size: 40),
                  title: Text('Harsh Sandesara'),
                  subtitle: Text(
                    '6942069420',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                  trailing: Icon(Icons.call),
                  onTap: () {},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.person, size: 40),
                  title: Text('Rohit Pai'),
                  subtitle: Text(
                    '0123456789',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                  trailing: Icon(Icons.call),
                  onTap: () {},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.person, size: 40),
                  title: Text('Ashutosh Naik'),
                  subtitle: Text(
                    '9876543210',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                  trailing: Icon(Icons.call),
                  onTap: () {},
                ),
              ),
            ],
          )),
          Center(
            child: FlatButton(
                onPressed: () {},
                child: Text('Add Contact'),
                color: Colors.purple.shade400,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
          ),
        ],
      ),
    ));
  }
}
