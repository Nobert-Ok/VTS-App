import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'package:voice_app/noteapp/new.dart';

// void main() => runApp(MaterialApp(
//       home: NewNote(),
//     ));

class NewNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0.0,
          title: Text(
            'Creating new note',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            // IconButton(
            //     icon: Icon(
            //       Icons.mic,
            //       color: Colors.white,
            //     ),
            //     onPressed: () {}),
            TextButton(
                onPressed: addNote,
                // onPressed: addNote,
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ],
        ),
        body: MyStatefulWidget(),
      ),
    );
  }

  void addNote() {}
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String title;
  String desc;
  final _formKey = GlobalKey<FormState>();
  // @overiide
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter title of note',
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                onChanged: (_val) {
                  title = _val;
                },
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                padding: const EdgeInsets.only(top: 12.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter note here',
                    border: InputBorder.none,
                  ),
                  minLines: 10,
                  maxLines: 50,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  onChanged: (_val) {
                    desc = _val;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addNote() async {
    // adding user notes into database
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('Personalnotes');

    var data = {
      'title': title,
      'description': desc,
      'created': DateTime.now(),
    };

    ref.add(data);

    //

    Navigator.pop(context);
  }
}
