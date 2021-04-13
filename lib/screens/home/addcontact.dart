import 'package:flutter/material.dart';
import 'package:vigila/models/user.dart';
import 'package:vigila/screens/home/emergency.dart';
import 'package:vigila/services/auth.dart';
import 'package:vigila/shared/constants.dart';
import 'package:vigila/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddContactScreen();
  }
}

class AddContactScreen extends State<AddContact> {
  String _name;
  String _phoneNumber;
  final _firestoreInstance = FirebaseFirestore.instance;
  User user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    FocusNode node = new FocusNode();
    return TextFormField(
      focusNode: node,
      decoration: InputDecoration(
          // Add name
          labelText: 'Name',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.purple.shade400),
          ),
          labelStyle: TextStyle(
              color: node.hasFocus ? Colors.black87 : Colors.purple.shade400)),
      validator: (String value) {
        // Name validator
        if (value.isEmpty) {
          return 'Name is required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    FocusNode node = new FocusNode();
    return TextFormField(
      focusNode: node,
      decoration: InputDecoration(
        // Add phone number
          labelText: 'Phone Number',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.purple.shade400),
          ),
          labelStyle: TextStyle(
              color: node.hasFocus ? Colors.black87 : Colors.purple.shade400)),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        // Phone number validator
        if (value.isEmpty) {
          return 'Phone number is required';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Screen title
        title: Text("Add Contact"),
        backgroundColor: Colors.purple[700],
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildName(),
                _buildPhoneNumber(),
                SizedBox(height: 50),
                Center(
                  child: FlatButton(
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();
                      _firestoreInstance
                          .collection("users")
                          .doc(user.uid)
                          .collection("emergency_contacts")
                          .add({"contact_number": _phoneNumber, "name": _name});
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Add Contact',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.purple.shade400,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
