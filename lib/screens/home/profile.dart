import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Screen to display user profile
  String name, blood_type, address, phone_number;
  User user = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  Future<DocumentSnapshot> _fetchDataFromFirebase() async {
    return await firestoreInstance.collection("users").doc(user.uid).get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchDataFromFirebase(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> docSnapshot) {
          // If data has not been fetched yet then show loading screen
          if (!docSnapshot.hasData) {
            return Text("Loading!");
          }
          // Fetch data from document snapshot
          Map<String, Object> data = docSnapshot.data.data();
          name = data['fname'].toString() + " " + data['lname'].toString();
          blood_type = data['blood_type'] == null
              ? "???"
              : data['blood_type'].toString();
          phone_number = data['contact_number'] == null
              ? "0123456789"
              : data['contact_number'].toString();

          return SafeArea(
            // Profile details
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("add you image URL here "),
                          fit: BoxFit.cover)),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    child: Container(
                      alignment: Alignment(0.0, 2.5),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("lib/images/Profile.webp"),
                        radius: 60.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.blueGrey,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Mumbai, India",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black45,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Phone Number: " + phone_number,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black45,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "Email ID: " + user.email,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black45,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "Blood Group: " + blood_type,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black45,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          );
        });
  }
}
