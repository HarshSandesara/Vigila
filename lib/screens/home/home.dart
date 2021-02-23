import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vigila/models/user.dart';
import 'package:vigila/models/emergency_contact.dart';
import 'package:sms_maintained/sms.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        title: "Welcome",
        body: "",
      ),
      PageViewModel(
        title: "Everything to keep you safe, right here",
        body: "",
      ),
      PageViewModel(
        title: "SOS Button",
        body: "Call anyone who can help",
      ),
      PageViewModel(
        title: "Emergency Contacts",
        body: "Inform people closest to you",
      ),
      PageViewModel(
        title: "First Aid Guidelines",
        body: "Provide Immediate Help to Victims",
      ),
      PageViewModel(
        title: "More features",
        body: "Let's Go!",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vigila"),
      ),
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        showNextButton: true,
        showSkipButton: true,
        skip: Text("Skip"),
        done: Text("Got it "),
        onDone: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyNavigationBar()),
          );
        },
      ),
    );
  }
}

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int focusedPage = 1;
  static List<Widget> _widgetOptions = <Widget>[
    ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.add_alert),
          title: Text('First Aid'),
        ),
        ListTile(
          leading: Icon(Icons.list),
          title: Text('RICE'),
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text('CPR'),
        ),
        ListTile(
          leading: Icon(Icons.list_alt),
          title: Text('BLS'),
        ),
      ],
    ),
    EmergencyButton(),
    Text('Profile Page',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      focusedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vigila'), backgroundColor: Colors.blue),
      body: Center(child: _widgetOptions.elementAt(focusedPage)),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.book),
                // ignore: deprecated_member_use
                title: Text('Guidelines'),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                // ignore: deprecated_member_use
                title: Text('Home'),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              // ignore: deprecated_member_use
              title: Text('Profile'),
              backgroundColor: Colors.blue,
            ),
          ],
          currentIndex: focusedPage,
          selectedItemColor: Colors.black,
          iconSize: 20,
          onTap: _onItemTapped),
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
  final firestoreInstance = FirebaseFirestore.instance;

  void _getEmergencyContacts() async {
    CustomUser user = CustomUser(uid: 'KrkmQMHewgexVNJFpz8H');

    // Get emergency contacts from firestore and them to the list
    await firestoreInstance
        .collection("users")
        .doc(user.uid)
        .collection("emergency_contacts")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        String contactNumber = result.data()['contact_number'];
        String name = result.data()['name'];
        EmergencyContact emergencyContact = new EmergencyContact(contactNumber: contactNumber, name: name);
        // Send sms to contacts
        emergencyContact.sendSMS();
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
              onPressed: () {
                _getEmergencyContacts();
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
