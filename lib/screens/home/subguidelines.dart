import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vigila/services/auth.dart';

class FirstAid extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        resizeToAvoidBottomInset: false,
        body: GlowingOverscrollColorChanger(
          color: Colors.purple[600],
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Cardiac Arrest:",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text(
                    "\u2022 Command someone to call 911 or the medical alert system for the locale.\n\u2022 Immediately start chest compressions regardless of your training. Compress hard and fast in the center of the chest, allowing recoil between compressions. Hand this task over to those who are trained if and when they arrive.\n\u2022 If you are trained, use chest compressions and rescue breathing.\n\u2022 An AED should be applied and used. But it is essential not to delay chest compressions, so finding one should be commanded to someone else while you are doing chest compressions.",
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Bleeding:",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text(
                      "\u2022 Cover the wound with a gauze or a cloth.\n\u2022Apply direct pressure to stop the blood flow.\n\u2022 Don't remove the cloth. Add more layers if needed. The cloth will help clots form to stop the flow."),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Burns:",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text(
                      "\u2022 Flush the burned area with cool running water for several minutes. Do not use ice.\n\u2022 Apply a light gauze bandage.\n\u2022 Do not apply ointments, butter, or oily remedies to the burn.\n\u2022 Take ibuprofen or acetaminophen for pain relief if necessary.\n\u2022 Do not break any blisters that may have formed."),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Blisters:",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text(
                      "\u2022 Use a sterilized needle and make small punctures at the edge of the blister.\n\u2022 Express the fluid.\n\u2022 Then apply antibiotic ointment.\n\u2022 Cover it to protect it from further rubbing and pressure."),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Breathing:",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text(
                      "\u2022 Sit the victim upright with support.\n\u2022 Loosen clothing.\n\u2022 If on medication for breathing problems, help with medications.\n\u2022 If a known history of over-breathing from anxiety exists, speak calmly and attempt stress reduction by identifying the fear. Direct victim to a quiet place.\n\u2022 Reassure and remain with victim until improved.\n\u2022 If breathing does not return to normal shortly get medical help.\n\u2022 Do not ignore someone over-breathing.\n\u2022 Do not force victim into an uncomfortable position."),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Poisoning:",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text(
                      "\u2022 Any direct contact with gases, fluids or any other material possibly containing poisons should be avoided.\n\u2022 Call your emergency medical system if the person is having trouble breathing, is unconscious, convulsing, or anything else which you think may be serious.\n\u2022 Follow the instructions on the container and/or call the poison control centre in your area.\n\u2022 Stay with the person and monitor their condition while waiting for the paramedics.\n\u2022 For inhaled poisons move the person to fresh air immediately as long as it is safe to do so.\n\u2022 For absorbed poisons use lots of running water to flush the area. If it is a powder chemical first brush it off with a cloth.\n\u2022 For ingested poisons do not automatically induce vomiting as this may cause burning of the airway if it is a corrosive substance. Do not automatically give fluids to drink as some substances may react more. Call the poison control centre.\n\u2022 For injected (e.g. needle, insects) poisons remove the object if you can do so without causing further harm."),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Fractures:",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text(
                      "\u2022 Don't try to straighten it.\n\u2022 Stabilize the limb using a splint and padding to keep it immobile.\n\u2022 Put a cold pack on the injury, avoiding placing ice directly on the skin.\n\u2022 Elevate the extremity.\n\u2022 Give anti-inflammatory drugs like ibuprofen or naproxen."),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Shocks:",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text(
                      "\u2022 Determine the cause of the injury and eliminate any hazards that may affect you or the victim.\n\u2022 Put on any personal protective equipment which may be necessary for the situation, such as latex gloves\n\u2022 for protection from blood born pathogens.\n\u2022 If the victim is not in danger, do not move them.\n\u2022 Treat life threatening situations first such as severe bleeding, cardiac arrest, or if the victim has stopped breathing.\n\u2022 Do not become a victim yourself. Leave rescue to trained personnel.\n\u2022 If you are alone, treat any life threatening injuries first, then get help.\n\u2022 If you are not alone send someone for help immediately."),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Sprains:",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text(
                      "\u2022 The symptoms of a sprain are almost exactly the same as that of a broken bone.\n\u2022 When in doubt, first aid for sprains should be the same as broken bones.\n\u2022 Immobilize the limb, apply a cold pack, elevate it, and take anti-inflammatory drugs."),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Nosebleeds:",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text(
                      "\u2022 Lean slightly forward, not back.\n\u2022 Pinch the nose just below the bridge. Don't pinch the nostrils closed by pinching lower.\n\u2022 Check after five minutes to see if bleeding has stopped. If not, continue pinching and check after another 10 minutes.\n\u2022 You can also apply a cold pack to the bridge of the nose while pinching."),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class RICE extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        resizeToAvoidBottomInset: false,
        body: GlowingOverscrollColorChanger(
          color: Colors.purple[600],
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Step 1: Rest",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text(
                    "\u2022 As soon as you’re hurt, stop your activity, and rest as much as possible for the first 2 days.\n\u2022Avoid putting weight on the injured area for 24 to 48 hours.\n\u2022Resting also helps prevent further bruising.",
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Step 2: Ice",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text(
                      "\u2022 Apply an ice pack (covered with a light, absorbent towel to help prevent frostbite) for 15-20 minutes every two to three hours during the first 24 to 48 hours after your injury.\n\u2022If you don’t have an ice pack, a bag of frozen peas or corn will work just fine."),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Step 3: Compression",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text(
                      "\u2022 Wrap the injured area to prevent swelling.\n\2022Wrap the affected area with an elastic medical bandage (like an ACE bandage).\n\2022Keep it snug but not too tight; if it’s too tight, it’ll interrupt blood flow.\n\2022If the skin below the wrap turns blue or feels cold, numb, or tingly, loosen the bandage.\n\2022If these symptoms don’t disappear right away, seek immediate medical help."),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Step 4: Elevation",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text(
                      "\u2022 Raise the sore body part above the level of your heart. Doing so reduces pain, throbbing, and swelling.\n\2022Keep the injured area raised whenever possible, even when you’re not icing it."),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class CPR extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        resizeToAvoidBottomInset: false,
        body: GlowingOverscrollColorChanger(
          color: Colors.purple[600],
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("1",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text("Call for help or ask someone else to.",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 60,
                  ),
                  Text("2",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text(
                      "Place the person carefully on their back and kneel beside their chest.\nTilt their head back slightly by lifting their chin.\nOpen their mouth and check for any obstruction, such as food or vomit.\nRemove any obstruction if it is loose. If it is not loose, trying to grasp it may push it farther into the airway.",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 60,
                  ),
                  Text("3",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text(
                      "Check for breathing. If they are not breathing, start CPR.\nIf someone is unconscious but still breathing, do not perform CPR.\nInstead, if they do not seem to have a spinal injury, place them in the recovery position.\nKeep monitoring their breathing and perform CPR if they stop breathing.",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 60,
                  ),
                  Text("4",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  Text("CPR Steps",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 30,
                  ),
                  Text("a. Perform 30 chest compressions.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "\u2022 Place one of your hands on top of the other and clasp them together.\n\u2022 With the heel of the hands and straight elbows, push hard and fast in the center of the chest, slightly below the nipples.\n\u2022 Push at least 2 inches deep.\n\u2022 Compress their chest at a rate of least 100 times per minute.\n\u2022 Let the chest rise fully between compressions."),
                  SizedBox(
                    height: 30,
                  ),
                  Text("b. Perform 2 rescue breaths.",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "\u2022 Making sure their mouth is clear, tilt their head back slightly and lift their chin.\n\u2022 Pinch their nose shut, place your mouth fully over theirs, and blow to make their chest rise.\n\u2022 If their chest does not rise with the first breath, retilt their head.\n\u2022 If their chest still does not rise with a second breath, the person might be choking."),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                      "c. Repeat until an ambulance or automated external defibrillator (AED) arrives.",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blueGrey,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "\u2022 Repeat the cycle of 30 chest compressions and two rescue breaths until the person starts breathing or help arrives.\n\u2022 If an AED arrives, carry on performing CPR until the machine is set up and ready to use."),
                ],
              ),
            ),
          ),
        ));
  }
}

/// Overrides the [GlowingOverscrollIndicator] color used by descendant widgets.
class GlowingOverscrollColorChanger extends StatelessWidget {
  final Widget child;
  final Color color;

  const GlowingOverscrollColorChanger({Key key, this.child, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: SpecifiableOverscrollColorScrollBehavior(color),
      child: child,
    );
  }
}

class SpecifiableOverscrollColorScrollBehavior extends ScrollBehavior {
  final Color _overscrollColor;

  const SpecifiableOverscrollColorScrollBehavior(this._overscrollColor);

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return child;
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      default:
        return GlowingOverscrollIndicator(
          child: child,
          axisDirection: axisDirection,
          color: _overscrollColor,
        );
    }
  }
}
