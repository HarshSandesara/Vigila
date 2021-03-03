import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class EmergencyContacts extends StatefulWidget {
  @override
  _EmergencyContactsState createState() => _EmergencyContactsState();
}

class _EmergencyContactsState extends State<EmergencyContacts> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<QuerySnapshot>(context);
    // print(users.docs);
    for (var doc in users.docs) {
      print(doc.data());
    }
    return Container();
  }
}
