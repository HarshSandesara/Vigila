import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vigila/services/auth.dart';
import 'package:vigila/models/emergency_contact.dart';
import 'package:vigila/screens/home/profile.dart';
import 'package:vigila/screens/home/emergency.dart';
import 'package:vigila/screens/home/guidelines.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vigila/services/database.dart';
import 'package:provider/provider.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  final AuthService _auth = AuthService();

  @override
  void initState() {
    super.initState();
  }

  int focusedPage = 1;
  static List<Widget> _widgetOptions = <Widget>[
    // Options available to user on entering the application
    Guidelines(),
    EmergencyButton(),
    Profile(),
    Emergency(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      focusedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().users,
      child: Scaffold(
        appBar: AppBar(
            // App title
            title: const Text('Vigila'),
            backgroundColor: Colors.purple[700],
            actions: <Widget>[
              FlatButton.icon(
                  icon: Icon(Icons.person, color: Colors.white),
                  label: Text('Logout', style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    await _auth.signOut();
                  }),
            ]),
        body: Center(child: _widgetOptions.elementAt(focusedPage)),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              // User navigable tabs
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Guidelines',
                backgroundColor: Colors.purple,
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.purple),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.purple,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contacts),
                label: 'Contacts',
                backgroundColor: Colors.purple,
              ),
            ],
            currentIndex: focusedPage,
            selectedItemColor: Colors.black,
            iconSize: 20,
            onTap: _onItemTapped),
      ),
    );
  }
}

class EmergencyButton extends StatefulWidget {
  EmergencyButton({Key key}) : super(key: key);

  @override
  _EmergencyButtonState createState() => _EmergencyButtonState();
}

class _EmergencyButtonState extends State<EmergencyButton> {
  Position _currentPosition;
  final AuthService _auth = AuthService();
  final firestoreInstance = FirebaseFirestore.instance;

  _getCurrentLocation() async {
    /// Determine the current position of the device.
    ///
    /// When the location services are not enabled or permissions
    /// are denied the `Future` will return an error.
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
      setState(() {
        _currentPosition = position;
      });
    });
  }

  void showSnackbar(BuildContext context) async {
    // This function intimates the user after SOS button is clicked
    await _getCurrentLocation();
    if (_currentPosition != null) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              "Message sent. Vigila will continue to send your location periodically to responders. If you wish to stop sending these messages, remove Vigila from the background."),
          duration: Duration(seconds: 3)));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Getting Location..."),
          duration: Duration(seconds: 3)));
    }
  }

  void _getEmergencyContacts(Position currentPosition) async {
    User user = FirebaseAuth.instance.currentUser;

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
        await emergencyContact.sendSMS(currentPosition);
      });
    });
  }

  void _getUsersInRadius() async {
    // Get user in 100 meter radius using GeoFlutterFire
    final geo = Geoflutterfire();
    final _firestore = FirebaseFirestore.instance;
    var collectionReference = _firestore.collection('users');
    double radius = 0.1;
    String field = 'position';

    GeoFirePoint center = geo.point(
        latitude: _currentPosition.latitude,
        longitude: _currentPosition.longitude);

    Stream<List<DocumentSnapshot>> stream = geo
        .collection(collectionRef: collectionReference)
        .within(center: center, radius: radius, field: field);

    stream.listen((List<DocumentSnapshot> documentList) {
      documentList.forEach((DocumentSnapshot document) async {
        String contactNumber = document.data()['contact_number'];
        String name = document.data()['fname'] + document.data()['lname'];
        print(contactNumber);
        print(name);
        EmergencyContact emergencyContact =
            new EmergencyContact(contactNumber: contactNumber, name: name);
        // Send sms to contacts
        await emergencyContact.sendSMS(_currentPosition);
      });
    });
  }

  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 200, height: 200),
            child: ElevatedButton(
              child: Text(
                'S.O.S.',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () async {
                // On button press call all the functions
                showSnackbar(context);
                await _getCurrentLocation();
                _getEmergencyContacts(_currentPosition);
                _getUsersInRadius();
              },
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), primary: Colors.red),
            ),
          ),
        );
      },
    );
  }
}
