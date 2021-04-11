import 'package:flutter/material.dart';

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
                onPressed: () {
                  showDialog<void>(
                      context: context, builder: (context) => dialog);
                },
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
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
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
              ),
              TextFormField(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
