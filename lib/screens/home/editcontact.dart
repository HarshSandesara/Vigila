import 'package:flutter/material.dart';
import 'package:vigila/models/user.dart';
import 'package:vigila/screens/home/emergency.dart';
import 'package:vigila/services/auth.dart';
import 'package:vigila/shared/constants.dart';
import 'package:vigila/shared/loading.dart';

class EditContact extends StatefulWidget {
  final String name, email, phoneNumber;
  EditContact({Key key, @required this.name, this.email, this.phoneNumber}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return EditContactScreen(name: name, email: email, phoneNumber: phoneNumber);
  }
}

class EditContactScreen extends State<EditContact> {
  final String name, email, phoneNumber;
  EditContactScreen({Key key, @required this.name, this.email, this.phoneNumber});
  String _name;
  String _email;
  String _phoneNumber;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    FocusNode node = new FocusNode();
    return TextFormField(
      initialValue: name,
      focusNode: node,
      // maxLength: 50,
      decoration: InputDecoration(
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

  Widget _buildEmail() {
    FocusNode node = new FocusNode();
    return TextFormField(
      initialValue: email,
      focusNode: node,
      decoration: InputDecoration(
          labelText: 'Email',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.purple.shade400),
          ),
          labelStyle: TextStyle(
              color: node.hasFocus ? Colors.black87 : Colors.purple.shade400)),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    FocusNode node = new FocusNode();
    return TextFormField(
      initialValue: phoneNumber,
      focusNode: node,
      decoration: InputDecoration(
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
        title: Text("Edit Contact"),
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
                _buildEmail(),
                _buildPhoneNumber(),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Save Changes',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.purple.shade400,
                    ),
                    SizedBox(width: 20),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.purple.shade400,
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
