import 'package:flutter/material.dart';
import 'package:vigila/models/user.dart';
import 'package:vigila/services/auth.dart';
import 'package:vigila/shared/constants.dart';
import 'package:vigila/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  final Function toggleNewUser;
  Register({this.toggleView, this.toggleNewUser});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // Text field state
  String fname = '';
  String lname = '';
  String email = '';
  String contactNumber = '';  
  String password = '';
  String confirmPassword = '';
  String error = '';
  String bloodGroup = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: new AppBar(
              title: Text("Sign Up to Vigila"),
              backgroundColor: Colors.purple[700],
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person, color: Colors.white),
                  label: Text('Sign In', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    widget.toggleView();
                    widget.toggleNewUser();
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'First Name'),
                        validator: (val) =>
                            val.isEmpty ? "Enter your first name" : null,
                        onChanged: (val) {
                          setState(() => fname = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Last Name'),
                        validator: (val) =>
                            val.isEmpty ? "Enter your last name" : null,
                        onChanged: (val) {
                          setState(() => lname = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? "Enter an email" : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Contact Number'),
                        validator: (val) {
                          if (val.length != 10) {
                            return "Enter your 10 digit contact number";
                          } else {
                            if (RegExp(r'^[0-9]+$').hasMatch(val)) {
                              return null;
                            } else {
                              return "Enter only digits";
                            }
                          }
                        },
                        onChanged: (val) {
                          setState(() => contactNumber = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Blood Group'),
                        validator: (val) =>
                            val.isEmpty ? "Enter your blood group" : null,
                        onChanged: (val) {
                          setState(() => bloodGroup = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        validator: (val) => val.length < 6
                            ? "Enter a password 6+ characters long"
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Confirm Password'),
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Enter the same password as above";
                          }
                          if (val != password) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => confirmPassword = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        color: Colors.purple[900],
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result =
                                await _auth.registerWithEmailAndPassword(
                                    email,
                                    password,
                                    fname,
                                    lname,
                                    bloodGroup,
                                    contactNumber);
                            if (!(result is CustomUser)) {
                              setState(() {
                                error = result;
                                loading = false;
                              });
                            }
                          }
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
