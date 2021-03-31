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
          image: Center(
            child:
                Image(image: AssetImage("lib/images/welcome.png"), height: 150),
          )),
      PageViewModel(
          title: "Everything to keep you safe, right here",
          body: "",
          image: Center(
            child: Image(
                image: AssetImage("lib/images/keep_you_safe.png"), height: 150),
          )),
      PageViewModel(
          title: "SOS Button",
          body: "Call anyone who can help",
          image: Center(
            child: Image(
                image: AssetImage("lib/images/sos_button.png"), height: 150),
          )),
      PageViewModel(
          title: "Emergency Contacts",
          body: "Inform people closest to you",
          image: Center(
            child: Image(
                image: AssetImage("lib/images/emergency_call.jpg"),
                height: 150),
          )),
      PageViewModel(
          title: "First Aid Guidelines",
          body: "Provide Immediate Help to Victims",
          image: Center(
              child: new Container(
            width: 150,
            height: 150,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("lib/images/guidelines.jpg"))),
          ))),
      PageViewModel(
          title: "More features",
          body: "Let's Go!",
          image: Center(
              child: new Container(
            width: 150,
            height: 150,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("lib/images/new_features.jpg"))),
          ))),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Vigila"),
        backgroundColor: Colors.purple[700],
      ),
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        showNextButton: true,
        showSkipButton: true,
        skip: Text("Skip"),
        done: Text("Got it "),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.purple[700],
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => IntroLoginConnector()),
          );
        },
      ),
    );
  }
}
