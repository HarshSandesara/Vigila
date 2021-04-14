import 'package:firebase_auth/firebase_auth.dart';
import 'package:vigila/models/user.dart';
import 'package:vigila/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _loginOrRegister;

  // create user obj based on User
  CustomUser _userFromFirebaseUser(User user) {
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<CustomUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // Sign in Anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign In with Email and Passwrod
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      _loginOrRegister = "login";
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          return "Your email address appears to be malformed";
        case "user-disabled":
          return "User with this email has been disabled";
        case "user-not-found":
          return "User with this email does not exist";
        case "wrong-password":
          return "Your password is wrong or hasn't been set";
      }
    }
  }

  // Register with Email and Password
  Future registerWithEmailAndPassword(
      String email,
      String password,
      String fname,
      String lname,
      String bloodType,
      String contactNumber) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      _loginOrRegister = "register";
      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid)
          .updateUserData(fname, lname, bloodType, contactNumber);
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          return "Your email address appears to be malformed";
        case "email-already-in-use":
          return "An account already exists with this email";
        // Weak password case is not checked as it is handled on the front end
      }
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
