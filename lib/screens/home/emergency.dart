import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vigila/models/emergency_contact.dart';
import 'package:vigila/shared/loading.dart';

class Emergency extends StatefulWidget {
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  bool loading = false;
  List<EmergencyContact> _emergencyContacts;

  Future<List<EmergencyContact>> _getEmergencyContacts() async {
    loading = true;
    final firestoreInstance = FirebaseFirestore.instance;
    User user = FirebaseAuth.instance.currentUser;
    List<EmergencyContact> emergencyContacts = new List<EmergencyContact>();

    // Get emergency contacts from firestore and them to the list
    await firestoreInstance
        .collection("users")
        .doc(user.uid)
        .collection("emergency_contacts")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) async {
        String contactNumber = result.data()['contact_number'];
        String name = result.data()['name'];
        print(contactNumber);
        print(name);
        EmergencyContact emergencyContact =
            new EmergencyContact(contactNumber: contactNumber, name: name);
        // Send sms to contacts
        emergencyContacts.add(emergencyContact);
      });
    });

    return emergencyContacts;
  }

  _EmergencyState() {
    _getEmergencyContacts().then((val) => setState(() {
          _emergencyContacts = val;
          loading = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                    child: ListView.builder(
                  itemCount: _emergencyContacts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.person, size: 40),
                        title: Text(_emergencyContacts[index].name),
                        subtitle: Text(
                          _emergencyContacts[index].contactNumber,
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        ),
                        trailing: Icon(Icons.call),
                        onTap: () {},
                      ),
                    );
                  },
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
