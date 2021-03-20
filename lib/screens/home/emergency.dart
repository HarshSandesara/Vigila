import 'package:flutter/material.dart';
import 'package:vigila/screens/home/addcontact.dart';
import 'package:vigila/screens/home/editcontact.dart';

class Emergency extends StatelessWidget {
  Future<String> createAlertDialog(BuildContext context, String name, String email, String phoneNumber) {

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("What do you want to do with $name?", style: TextStyle(fontSize: 15),),
        actions: <Widget> [
          MaterialButton(
            elevation: 5,
            child: Text('Call'),
            onPressed: () {
              Navigator.of(context).pop();
            }
            ),
            MaterialButton(
            elevation: 5,
            child: Text('Edit'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditContact(name: name, email: email,phoneNumber: phoneNumber),
                ),
              );
            }
            ),
            MaterialButton(
            elevation: 5,
            child: Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop();
            }
            )
        ]
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your Emergency Contact List",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple[900],
                  fontWeight: FontWeight.w800),
            ),
          ),
          Expanded(
            child: ListView(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.person,
                  size: 40),
                  title: Text('Harsh Sandesara'),
                  subtitle: Text('6942069420',
                  style: TextStyle(
                    color: Colors.purple,
                  ),),
                  trailing: Icon(Icons.call),
                  onTap: () {
                    createAlertDialog(context, "Harsh Sandesara", "sandesara.harsh@gmail.com", "6942069420");
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.person,
                  size: 40),
                  title: Text('Rohit Pai'),
                  subtitle: Text('0123456789',
                  style: TextStyle(
                    color: Colors.purple,
                  ),),
                  trailing: Icon(Icons.call),
                  onTap: () {
                    createAlertDialog(context, "Rohit Pai", "rohit23110@gmail.com", "0123456789");
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.person,
                  size: 40),
                  title: Text('Ashutosh Naik'),
                  subtitle: Text('9876543210',
                  style: TextStyle(
                    color: Colors.purple,
                  ),),
                  trailing: Icon(Icons.call),
                  onTap: () {
                    createAlertDialog(context, "Ashutosh Naik", "infernape.po@gmail.com", "9876543210");
                  },
                ),
              ),
            ],
          )),
          Center(
            child: FlatButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddContact(),
                ),
              );
            },
            child: Text('Add Contact'),
            color: Colors.purple.shade400,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
            ),
          ),
        ],
      ),
    ));
  }
}