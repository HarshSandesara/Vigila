import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:geolocator/geolocator.dart';

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

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
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

    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  // This function shows the Location of the user as a snackbar
  void showSnackbar(BuildContext context) async {
    await _getCurrentLocation();
    if (_currentPosition != null) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),
          duration: Duration(seconds: 5)));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Getting Location..."),
          duration: Duration(seconds: 5)));
    }
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
                showSnackbar(context);
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
