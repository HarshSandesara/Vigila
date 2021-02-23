import 'package:firebase_auth/firebase_auth.dart';
import 'package:vigila/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  // Register with Email and Password

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
