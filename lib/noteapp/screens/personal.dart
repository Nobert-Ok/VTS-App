import 'package:flutter/material.dart';
import 'newPersonalNote.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'viewNote.dart';

class PersonalScreen extends StatefulWidget {
  @override
  _PersonalScreen createState() => _PersonalScreen();
}

class _PersonalScreen extends State<PersonalScreen> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection('Personalnotes');
  List<Color> myColors = [
    Colors.yellow[200],
    Colors.red[200],
    Colors.green[200],
    Colors.deepPurple[200],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => NewNote(),
              ),
            ).then((value) {
              print("Calling Set  State !");
              setState(() {});
            });
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.blue,
          elevation: 0.0,
          title: Text('NoteBook:Personal',
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: ref.get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.all(10.0),
                  child: GridView.builder(
                    itemCount: snapshot.data.docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0),
                    itemBuilder: (BuildContext context, int index) {
                      Random random = new Random();
                      Color bg = myColors[random.nextInt(4)];
                      Map data = snapshot.data.docs[index].data();
                      DateTime mydateTime = data['created'].toDate();
                      String formattedTime =
                          DateFormat.yMMMd().add_jm().format(mydateTime);
                      return Container(
                          width: 200,
                          // height: 400,
                          // padding: EdgeInsets.all(10),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Card(
                            color: bg,
                            elevation: 5.0,
                            child: InkWell(
                              child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Column(children: [
                                    Text(
                                      "${data['title']}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        "${data['description']}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 7,
                                        softWrap: true,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 50,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.blueAccent),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          // decoration: ShapeDecoration(
                                          //   shape: RoundedRectangleBorder(
                                          //     borderRadius: BorderRadius.circular(50),
                                          //   ),
                                          // ),
                                          child:
                                              Center(child: Text('Personal.')),
                                        ),
                                        // IconButton(
                                        //   icon: Icon(
                                        //     Icons.delete,
                                        //     color: Colors.blueAccent,
                                        //   ),
                                        //   onPressed: () {
                                        //     showDialog<void>(
                                        //         context: context,
                                        //         builder: (context) => dialog);
                                        //   },
                                        // ),
                                        // IconButton(
                                        //   icon: Icon(
                                        //     Icons.edit,
                                        //     color: Colors.blueAccent,
                                        //   ),
                                        //   onPressed: () {
                                        //     showDialog<void>(
                                        //         context: context,
                                        //         builder: (context) => dialog);
                                        //   },
                                        // ),
                                        // LikeButton(),
                                      ],
                                    ),
                                  ])),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ViewScreen(
                                                data,
                                                formattedTime,
                                                snapshot.data.docs[index]
                                                    .reference)));
                              },
                            ),
                          ));

                      // Image.network(images[index]);
                    },
                  ),
                );
              } else {
                return Center(
                  child: Text("Loading..."),
                );
              }
            }),
      ),
    );
  }
}

class FullScreenDialogue extends StatelessWidget {
  FullScreenDialogue(this.titleD, this.tbody);
  final String titleD;
  final String tbody;
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          titleD,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog<void>(
                    context: context, builder: (context) => dialog);
              }),
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            tbody,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
