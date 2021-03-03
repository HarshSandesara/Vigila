import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String bloodType, String fname, String lname) async {
    return await userCollection.doc(uid).set({
      'blood_type': bloodType,
      'fname': fname,
      'lname': lname,
    });
  }

  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
