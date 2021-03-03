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
          child: Image.network("https://p18cdn4static.sharpschool.com/UserFiles/Servers/Server_286693/Image/Registration/welcome.png", height: 150),
        )
      ),
      PageViewModel(
        title: "Everything to keep you safe, right here",
        body: "",
        image: Center(
          child: Image.network("https://tinhat.co.uk/sites/default/files/users/user1/fast%20claims%20handling_0.png", height: 150),
        )
      ),
      PageViewModel(
        title: "SOS Button",
        body: "Call anyone who can help",
        image: Center(
          child: Image.network("https://image.flaticon.com/icons/png/512/745/745411.png", height: 150),
        )
      ),
      PageViewModel(
        title: "Emergency Contacts",
        body: "Inform people closest to you",
        image: Center(
          child: Image.network("https://media.istockphoto.com/vectors/emergency-call-call-phone-in-hand-vector-illustration-vector-id688494412?k=6&m=688494412&s=612x612&w=0&h=dkE22VCAHCoYDZAEE5YOgROZ6szjhcxvypGO0fDNoak=", height: 150),
        )
      ),
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
                    image: new NetworkImage(
                        "https://media.istockphoto.com/vectors/first-aid-kit-vector-id482952886?k=6&m=482952886&s=612x612&w=0&h=jeuFvQmLaG9syv-d-hR4oWJ6EcpWy2_NnhgxUx0d_zg=")
                )
            ),
          )
          
        )
      ),
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
                    image: new NetworkImage(
                        "https://www.imedicalapps.com/wp-content/uploads/2017/12/iStock-669282098.jpg")
                )
            ),
          )
          
        )
      ),
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
