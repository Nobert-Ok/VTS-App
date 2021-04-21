import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:voice_app/custompainter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:voice_app/model/todo.dart';
import 'package:voice_app/noteapp/mainnote.dart';
import 'package:voice_app/qrcode/main.dart';
import 'package:voice_app/timer/main.dart';
import 'package:voice_app/todo.dart';

import 'login.dart';

String convertToTitleCase(String text) {
  if (text == null) {
    return null;
  }

  if (text.length <= 1) {
    return text.toUpperCase();
  }

  // Split string into multiple words
  final List<String> words = text.split(' ');

  // Capitalize first letter of each words
  final capitalizedWords = words.map((word) {
    final String firstLetter = word.substring(0, 1).toUpperCase();
    final String remainingLetters = word.substring(1);

    return '$firstLetter$remainingLetters';
  });

  // Join/Merge all words back to one String
  return capitalizedWords.join(' ');
}

final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
var email = user.email;
var text = (email.substring(0, 4));
String texts = convertToTitleCase(text);
var displayname = user.uid;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

final dbref = FirebaseFirestore.instance.collection('users');

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    // final FirebaseAuth auth = FirebaseAu

    final AlertDialog dialog = AlertDialog(
      content: Text('This page is still under development'),
      actions: [
        FlatButton(
          textColor: Colors.blueAccent,
          onPressed: () => Navigator.pop(context),
          child: Text('OKAY'),
        ),
      ],
    );
    if (user != null) {
      displayname = user.displayName;
      email = user.email;
    }

    return new Scaffold(
        appBar: AppBar(
          title: Text(
            "$texts\'s Collection",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          elevation: 4.0,
          // leading: Container(),
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  auth.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()));
                })
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('$texts'),
                accountEmail: Text('$email'),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: ListTile(
                    title: Text("Log out"),
                    leading: Icon(Icons.logout, color: Colors.blue)),
              ),
              Divider(),
            ],
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Todolist()));
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                                colors: [Colors.blue, Colors.blue[300]]),
                            boxShadow: [BoxShadow(color: Colors.blue[50])],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: CustomPaint(
                          size: Size(100, 150),
                          painter: CustomCardShapePainter(
                              25, Colors.blue, Colors.blue[50]),
                        ),
                      ),
                      Positioned.fill(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Icon(
                                Icons.chrome_reader_mode,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("$texts\'s ToDo List",
                                      style: TextStyle(
                                        fontSize: 19.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      )),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Container(
                                    width: 150.0,
                                    child: Text(
                                        "Keep track of the activities lined up for you",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => NoteApp()));
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                                colors: [Colors.blue, Colors.blue[300]]),
                            boxShadow: [BoxShadow(color: Colors.blue[50])],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: CustomPaint(
                          size: Size(100, 150),
                          painter: CustomCardShapePainter(
                              25, Colors.blue, Colors.blue[50]),
                        ),
                      ),
                      Positioned.fill(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Icon(
                                Icons.assignment_outlined,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("$texts\'s NoteBook",
                                      style: TextStyle(
                                        fontSize: 19.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      )),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Container(
                                    width: 150.0,
                                    child: Text(
                                        "Here you can take notes and visit them at your convenient",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Qrcode()));
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                                colors: [Colors.blue, Colors.blue[300]]),
                            boxShadow: [BoxShadow(color: Colors.blue[50])],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: CustomPaint(
                          size: Size(100, 150),
                          painter: CustomCardShapePainter(
                              25, Colors.blue, Colors.blue[50]),
                        ),
                      ),
                      Positioned.fill(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("$texts\'s Scanner",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      )),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Container(
                                    width: 150.0,
                                    child: Text(
                                        "Scan all products with Qrcode and also generate your Qrcode",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => BaseApp()));
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                                colors: [Colors.blue, Colors.blue[300]]),
                            boxShadow: [BoxShadow(color: Colors.blue[50])],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: CustomPaint(
                          size: Size(100, 150),
                          painter: CustomCardShapePainter(
                              25, Colors.blue, Colors.blue[50]),
                        ),
                      ),
                      Positioned.fill(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Icon(
                                Icons.timer,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("$texts\'s Timer ",
                                      style: TextStyle(
                                        fontSize: 19.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      )),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Container(
                                    width: 150.0,
                                    child: Text(
                                        "This is a pamodoro timer which you can use to time your studies for 25 minutes",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
