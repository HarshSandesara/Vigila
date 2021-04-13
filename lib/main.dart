import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vigila/screens/home/introduction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:after_layout/after_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vigila/screens/home/introloginconnector.dart';
import 'package:vigila/shared/loading.dart';

Future<void> requestPermission() async {
  // Requests for location permissions from the user
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    print('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    print(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      return print(
          'Location permissions are denied (actual value: $permission).');
    }
  }
}

void getLocation() async {
  // Fetches the current location of the user and updates it in the database
  await Firebase.initializeApp();

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);
  print(position);
  if (FirebaseAuth.instance.currentUser != null) {
    print("Hello!");
    GeoFirePoint myLocation = Geoflutterfire()
        .point(latitude: position.latitude, longitude: position.longitude);
    print(myLocation);
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({"position": myLocation.data});
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AndroidAlarmManager.initialize();
  await requestPermission();

  runApp(MyApp());

  final int helloAlarmID = 0;
  // Fetches location every minute
  await AndroidAlarmManager.periodic(
      const Duration(seconds: 60), helloAlarmID, getLocation);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new IntroScreen());
  }
}


// This class is used to display the intro screen only once
class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with AfterLayoutMixin<IntroScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroLoginConnector()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new MainPage()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Loading(),
    );
  }
}