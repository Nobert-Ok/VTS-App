import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailField;
  TextEditingController _passwordField;
  TextEditingController _displayName;

  @override
  void initState() {
    super.initState();
    _emailField = TextEditingController(text: "");
    _passwordField = TextEditingController(text: "");
    _displayName = TextEditingController(text: "");
  }

  // TextEditingController _emailField = TextEditingController();
  // TextEditingController _passwordField = TextEditingController();
  // TextEditingController _displayName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 90.0, 0.0, 0.0),
                  child: Text(
                    'Signup',
                    style:
                        TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(250.0, 79.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _emailField,
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _passwordField,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                    obscureText: true,
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: _displayName,
                    decoration: InputDecoration(
                        labelText: 'NICK NAME ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.blue,
                        color: Colors.blue,
                        elevation: 7.0,
                        child: Center(
                          child: TextButton(
                              child: Text(
                                'SIGNUP',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                              onPressed: () {
                                if (_passwordField.text.length < 6) {
                                  displayToastMsg(
                                      "Password must be atleast 6 characters",
                                      context);
                                } else if (!_emailField.text.contains("@")) {
                                  displayToastMsg(
                                      "Email address not valid", context);
                                } else if (_displayName.text.length > 4) {
                                  displayToastMsg(
                                      "Nickname should be at most 4", context);
                                } else
                                  registerNewuser(context);
                              }),
                        ),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blue,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Center(
                          child: Text('Go Back',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  color: Colors.blue)),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ]));
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void registerNewuser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailField.text, password: _passwordField.text)
            .catchError((errMsg) {
      displayToastMsg("Password should be at least 6 characters", context);
    }))
        .user;
    if (firebaseUser != null) {
      FirebaseFirestore.instance.collection("users").add({
        "name": _displayName.text,
        "password": _passwordField.text,
        "email": _emailField.text,
      }).catchError((e) {
        print(e);
      });
      // db.collection("users").document.set(userDataMap);
      displayToastMsg("User created", context);
      Navigator.pushNamed(context, "/login");
    } else {
      displayToastMsg("User not created", context);
    }
  }

  displayToastMsg(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
