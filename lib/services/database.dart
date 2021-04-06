import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String fname, String lname, String bloodType, String contactNumber) async {
    return await userCollection.doc(uid).set({
      'fname': fname,
      'lname': lname,
      'contact_number': contactNumber,
      'blood_type': bloodType,
      'position': {},
    });
  }

  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
