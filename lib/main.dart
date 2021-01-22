import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

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

// class Home extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//         // This makes the visual density adapt to the platform that you run
//         // the app on. For desktop platforms, the controls will be smaller and
//         // closer together (more dense) than on mobile platforms.
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Vigila'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             // MyNavigationBar(),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//        // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

class MyNavigationBar extends StatefulWidget {  
  MyNavigationBar ({Key key}) : super(key: key);  
  
  @override  
  _MyNavigationBarState createState() => _MyNavigationBarState();  
}  
  
class _MyNavigationBarState extends State<MyNavigationBar > {  
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
    Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 200, height: 200),
          child: ElevatedButton(
            child: Text(
              'S.O.S.',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(), primary: Colors.red),
          ),
        ),
    ),
    Text('Profile Page', style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal)),
  ];
  
  void _onItemTapped(int index) {
    setState(() {  
      focusedPage = index;
    });
  }
  
  @override  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vigila'),
          backgroundColor: Colors.blue
      ),  
      body: Center(
        child: _widgetOptions.elementAt(focusedPage),
      ),  
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            // ignore: deprecated_member_use
            title: Text('Guidelines'),
            backgroundColor: Colors.blue
          ),  
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            title: Text('Home'),
            backgroundColor: Colors.blue
          ),  
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
        onTap: _onItemTapped
      ),
    );
  }  
}  
