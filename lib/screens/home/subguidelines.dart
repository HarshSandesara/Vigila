import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vigila/services/auth.dart';

class FirstAid extends StatelessWidget {
  // First Aid Guidelines
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // App title
          title: const Text('Vigila'),
          backgroundColor: Colors.purple[700],
        ),
        body: ListView.builder(
          // Screen body
          itemBuilder: (BuildContext context, int index) =>
              EntryItemFirstAid(dataFirstAid[index]),
          itemCount: dataFirstAid.length,
        ),
      ),
    );
  }
}

class EntryFirstAid {
  // Class to define first aid entries
  EntryFirstAid(this.title, [this.children = const <EntryFirstAid>[]]);
  // Two parameters: A string and a List of EntryFirstAid type objects
  final String title;
  final List<EntryFirstAid> children;
}

// First Aid data
final List<EntryFirstAid> dataFirstAid = <EntryFirstAid>[
  EntryFirstAid(
    'Bleeding',
    <EntryFirstAid>[
      EntryFirstAid('• Cover the wound with a gauze or a cloth.'),
      EntryFirstAid('• Apply direct pressure to stop the blood flow.'),
      EntryFirstAid('• Don\'t remove the cloth. Add more layers if needed. The cloth will help clots form to stop the flow.'),
    ],
  ),
  EntryFirstAid(
    'Blisters',
    <EntryFirstAid>[
      EntryFirstAid('• Use a sterilized needle and make small punctures at the edge of the blister.'),
      EntryFirstAid('• Express the fluid.'),
      EntryFirstAid('• Then apply antibiotic ointment.'),
      EntryFirstAid('• Cover it to protect it from further rubbing and pressure.'),
    ],
  ),
  EntryFirstAid(
    'Breathing',
    <EntryFirstAid>[
      EntryFirstAid('• Sit the victim upright with support.'),
      EntryFirstAid('• Loosen clothing.'),
      EntryFirstAid('• If on medication for breathing problems, help with medications.'),
      EntryFirstAid('• If a known history of over-breathing from anxiety exists, speak calmly and attempt stress reduction by identifying the fear. Direct victim to a quiet place.'),
      EntryFirstAid('• Reassure and remain with victim until improved.'),
      EntryFirstAid('• If breathing does not return to normal shortly get medical help.'),
      EntryFirstAid('• Do not ignore someone over-breathing.'),
      EntryFirstAid('• Do not force victim into an uncomfortable position.'),
    ],
  ),
  EntryFirstAid(
    'Burns',
    <EntryFirstAid>[
      EntryFirstAid('• Flush the burned area with cool running water for several minutes. Do not use ice.'),
      EntryFirstAid('• Apply a light gauze bandage.'),
      EntryFirstAid('• Do not apply ointments, butter, or oily remedies to the burn.'),
      EntryFirstAid('• Take ibuprofen or acetaminophen for pain relief if necessary.'),
      EntryFirstAid('• Do not break any blisters that may have formed.'),
    ],
  ),
  EntryFirstAid(
    'Cardiac Arrest',
    <EntryFirstAid>[
      EntryFirstAid('• Command someone to call 911 or the medical alert system for the locale.'),
      EntryFirstAid('• Immediately start chest compressions regardless of your training. Compress hard and fast in the center of the chest, allowing recoil between compressions. Hand this task over to those who are trained if and when they arrive.'),
      EntryFirstAid('• If you are trained, use chest compressions and rescue breathing.'),
      EntryFirstAid('• An AED should be applied and used. But it is essential not to delay chest compressions, so finding one should be commanded to someone else while you are doing chest compressions.'),
    ],
  ),
  EntryFirstAid(
    'Fractures',
    <EntryFirstAid>[
      EntryFirstAid('• Don\'t try to straighten it.'),
      EntryFirstAid('• Stabilize the limb using a splint and padding to keep it immobile.'),
      EntryFirstAid('• Put a cold pack on the injury, avoiding placing ice directly on the skin.'),
      EntryFirstAid('• Elevate the extremity.'),
      EntryFirstAid('• Give anti-inflammatory drugs like ibuprofen or naproxen.'),
    ],
  ),
  EntryFirstAid(
    'Nosebleeds',
    <EntryFirstAid>[
      EntryFirstAid('• Lean slightly forward, not back.'),
      EntryFirstAid('• Pinch the nose just below the bridge. Don\'t pinch the nostrils closed by pinching lower.'),
      EntryFirstAid('• Check after five minutes to see if bleeding has stopped. If not, continue pinching and check after another 10 minutes.'),
      EntryFirstAid('• You can also apply a cold pack to the bridge of the nose while pinching.'),
    ],
  ),
  EntryFirstAid(
    'Poisoning',
    <EntryFirstAid>[
      EntryFirstAid('• Any direct contact with gases, fluids or any other material possibly containing poisons should be avoided.'),
      EntryFirstAid('• Call your emergency medical system if the person is having trouble breathing, is unconscious, convulsing, or anything else which you think may be serious.'),
      EntryFirstAid('• Follow the instructions on the container and/or call the poison control centre in your area.'),
      EntryFirstAid('• Stay with the person and monitor their condition while waiting for the paramedics.'),
      EntryFirstAid('• For inhaled poisons move the person to fresh air immediately as long as it is safe to do so.'),
      EntryFirstAid('• For absorbed poisons use lots of running water to flush the area. If it is a powder chemical first brush it off with a cloth.'),
      EntryFirstAid('• For ingested poisons do not automatically induce vomiting as this may cause burning of the airway if it is a corrosive substance. Do not automatically give fluids to drink as some substances may react more. Call the poison control centre.'),
      EntryFirstAid('• For injected poisons (e.g. needle, insects) remove the object if you can do so without causing further harm.'),
    ],
  ),
  EntryFirstAid(
    'Shocks',
    <EntryFirstAid>[
      EntryFirstAid('• Determine the cause of the injury and eliminate any hazards that may affect you or the victim.'),
      EntryFirstAid('• Put on any personal protective equipment which may be necessary for the situation, such as latex gloves for protection from blood born pathogens.'),
      EntryFirstAid('• If the victim is not in danger, do not move them.'),
      EntryFirstAid('• Treat life threatening situations first such as severe bleeding, cardiac arrest, or if the victim has stopped breathing.'),
      EntryFirstAid('• Do not become a victim yourself. Leave rescue to trained personnel.'),
      EntryFirstAid('• If you are alone, treat any life threatening injuries first, then get help.'),
      EntryFirstAid('• If you are not alone send someone for help immediately.'),
    ],
  ),
  EntryFirstAid(
    'Sprains',
    <EntryFirstAid>[
      EntryFirstAid('• The symptoms of a sprain are almost exactly the same as that of a broken bone.'),
      EntryFirstAid('• When in doubt, first aid for sprains should be the same as broken bones.'),
      EntryFirstAid('• Immobilize the limb, apply a cold pack, elevate it, and take anti-inflammatory drugs.'),
    ],
  ),
];

class EntryItemFirstAid extends StatelessWidget {
  const EntryItemFirstAid(this.entry);

  final EntryFirstAid entry;
  // Widget containing first aid information
  Widget _buildTiles(EntryFirstAid root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<EntryFirstAid>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class RICE extends StatelessWidget {
  // RICE guidelines
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // App title
          title: const Text('Vigila'),
          backgroundColor: Colors.purple[700],
        ),
        body: ListView.builder(
          // Screen body
          itemBuilder: (BuildContext context, int index) =>
              EntryItemRICE(dataRICE[index]),
          itemCount: dataRICE.length,
        ),
      ),
    );
  }
}

class EntryRICE {
  // Class to define RICE entries
  EntryRICE(this.title, [this.children = const <EntryRICE>[]]);
  // Two parameters: A string and a List of EntryRICE type objects
  final String title;
  final List<EntryRICE> children;
}

// RICE data
final List<EntryRICE> dataRICE = <EntryRICE>[
  EntryRICE(
    'Step 1: Rest',
    <EntryRICE>[
      EntryRICE('As soon as you’re hurt, stop your activity, and rest as much as possible for the first 2 days.'),
      EntryRICE('Avoid putting weight on the injured area for 24 to 48 hours.'),
      EntryRICE('Resting also helps prevent further bruising.'),
    ],
  ),
  EntryRICE(
    'Step 2: Ice',
    <EntryRICE>[
      EntryRICE('Apply an ice pack (covered with a light, absorbent towel to help prevent frostbite) for 15-20 minutes every two to three hours during the first 24 to 48 hours after your injury.'),
      EntryRICE('If you don’t have an ice pack, a bag of frozen peas or corn will work just fine.'),
    ],
  ),
  EntryRICE(
    'Step 3: Compression',
    <EntryRICE>[
      EntryRICE('Wrap the injured area to prevent swelling.'),
      EntryRICE('Wrap the affected area with an elastic medical bandage (like an ACE bandage).'),
      EntryRICE('Keep it snug but not too tight; if it’s too tight, it’ll interrupt blood flow.'),
      EntryRICE('If the skin below the wrap turns blue or feels cold, numb, or tingly, loosen the bandage.'),
      EntryRICE('If these symptoms don’t disappear right away, seek immediate medical help.'),
    ],
  ),
  EntryRICE(
    'Step 4: Elevation',
    <EntryRICE>[
      EntryRICE('Raise the sore body part above the level of your heart. Doing so reduces pain, throbbing, and swelling.'),
      EntryRICE('Keep the injured area raised whenever possible, even when you’re not icing it.'),
    ],
  ),
];

class EntryItemRICE extends StatelessWidget {
  const EntryItemRICE(this.entry);

  final EntryRICE entry;
  // Widget containing RICE information
  Widget _buildTiles(EntryRICE root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<EntryRICE>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class CPR extends StatelessWidget {
  // CPR guidelines
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // App title
          title: const Text('Vigila'),
          backgroundColor: Colors.purple[700],
        ),
        body: ListView.builder(
          // Screen body
          itemBuilder: (BuildContext context, int index) =>
              EntryItemCPR(dataCPR[index]),
          itemCount: dataCPR.length,
        ),
      ),
    );
  }
}

class EntryCPR {
  // Class to define CPR entries
  EntryCPR(this.title, [this.children = const <EntryCPR>[]]);
  // Two parameters: A string and a List of EntryCPR type objects
  final String title;
  final List<EntryCPR> children;
}

// CPR data
final List<EntryCPR> dataCPR = <EntryCPR>[
  EntryCPR(
    'Preliminary Steps',
    <EntryCPR>[
      EntryCPR('1\nCall for help or ask someone else to.'),
      EntryCPR('2\nPlace the person carefully on their back and kneel beside their chest.\n\nTilt their head back slightly by lifting their chin.\n\nOpen their mouth and check for any obstruction, such as food or vomit.\n\nRemove any obstruction if it is loose. If it is not loose, trying to grasp it may push it farther into the airway.'),
      EntryCPR('3\nCheck for breathing. If they are not breathing, start CPR.\n\nIf someone is unconscious but still breathing, do not perform CPR.\n\nInstead, if they do not seem to have a spinal injury, place them in the recovery position.\n\nKeep monitoring their breathing and perform CPR if they stop breathing.'),
    ],
  ),
  EntryCPR(
    'CPR',
    <EntryCPR>[
      EntryCPR('a. Perform 30 chest compressions.',
        <EntryCPR>[
          EntryCPR('Place one of your hands on top of the other and clasp them together.')
        ],
      ),
      EntryCPR('b. Perform 2 rescue breaths.',
        <EntryCPR>[
          EntryCPR('Making sure their mouth is clear, tilt their head back slightly and lift their chin.'),
          EntryCPR('Pinch their nose shut, place your mouth fully over theirs, and blow to make their chest rise.'),
          EntryCPR('If their chest does not rise with the first breath, retilt their head.'),
          EntryCPR('If their chest still does not rise with a second breath, the person might be choking.'),
        ],
      ),
      EntryCPR('c. Repeat until an ambulance or automated external defibrillator (AED) arrives.',
        <EntryCPR>[
          EntryCPR('Repeat the cycle of 30 chest compressions and two rescue breaths until the person starts breathing or help arrives.'),
          EntryCPR('If an AED arrives, carry on performing CPR until the machine is set up and ready to use.'),
        ],
      ),
    ],
  ),
];

class EntryItemCPR extends StatelessWidget {
  const EntryItemCPR(this.entry);

  final EntryCPR entry;
  // Widget containing CPR information
  Widget _buildTiles(EntryCPR root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<EntryCPR>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class HelpLineNumbers extends StatelessWidget {
  // List<HelpLineNumbers> _helpLineNumbers;
  final String name;
  final String contactNumber;
  HelpLineNumbers(this.name, this.contactNumber);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(
          // App title
          title: const Text('Vigila'),
          backgroundColor: Colors.purple[700],
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10,10,10,0),
          width: double.maxFinite,
          child:ListView.builder(
            itemCount: _helpLineNumbers.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.person, size: 40),
                  title: Text(_helpLineNumbers[index].name),
                  subtitle: Text(
                    _helpLineNumbers[index].contactNumber,
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                  trailing: Icon(Icons.call),
                  onTap: () {
                    
                  },
                ),
              );
            }
          )
        ),
      )
    );
  }
}

final List<HelpLineNumbers> _helpLineNumbers = <HelpLineNumbers>[
  HelpLineNumbers('National Emergency Number', '112'),
  HelpLineNumbers('Police', '100'),
  HelpLineNumbers('Fire Brigade', '101'),
  HelpLineNumbers('Ambulance', '102'),
  HelpLineNumbers('Disaster Management Services', '108'),
  HelpLineNumbers('Women Helpline', '1091'),
  HelpLineNumbers('Women Helpline-Domestic Abuse', '181'),
  HelpLineNumbers('Senior Citizen Helpline', '1091, 1291'),
  HelpLineNumbers('Road Accident Emergency Service', '1073'),
  HelpLineNumbers('Children In Difficult Situation', '1098'),
  HelpLineNumbers('AIIMS Poison Control Centre', '011-26593677, 26589391, 26583282'),
  HelpLineNumbers('LPG Gelpline', '1906'),
];