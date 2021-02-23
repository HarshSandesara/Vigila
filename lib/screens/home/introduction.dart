import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:vigila/screens/home/introloginconnector.dart';

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
      appBar: AppBar(title: Text("Vigila")),
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
            MaterialPageRoute(builder: (context) => IntroLoginConnector()),
          );
        },
      ),
    );
  }
}
