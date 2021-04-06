import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vigila/screens/home/introduction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

Future<void> requestPermission() async {
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
  await AndroidAlarmManager.periodic(
      const Duration(seconds: 5), helloAlarmID, getLocation);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: MainPage());
    return MaterialApp(home: MainPage());
  }
}

// Fetching and writing geopoints to firestore...

/*
  Position _currentPosition;
  _getCurrentLocation() async {
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

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      _currentPosition = position;
    });
  }

  final geo = Geoflutterfire();
  final _firestore = FirebaseFirestore.instance;
  GeoFirePoint myLocation = geo.point(latitude: 19.228653, longitude: 72.855852);

  _firestore
      .collection('users')
      .doc('RcfbEJV3ghe3i2z737GJQjhvm9d2')
      .update({'position': myLocation.data});

  // Create a geoFirePoint
  // MALAD : latitude: 19.187306, longitude: 72.848357
  // BORIVALI: latitude: 19.229239, longitude: 72.840989
  await _getCurrentLocation();
  GeoFirePoint center = geo.point(latitude: _currentPosition.latitude, longitude: _currentPosition.longitude);

  var collectionReference = _firestore.collection('users');

  double radius = 0.1;
  String field = 'position';

  Stream<List<DocumentSnapshot>> stream = geo
      .collection(collectionRef: collectionReference)
      .within(center: center, radius: radius, field: field);

  stream.listen((List<DocumentSnapshot> documentList) {
    documentList.forEach((DocumentSnapshot document) {
      print(document.data());
    });
  });

*/
