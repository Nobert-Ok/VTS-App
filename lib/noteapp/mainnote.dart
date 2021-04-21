import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'package:voice_app/noteapp/screens/viewNote.dart';
import '../home.dart';
import 'screens/work.dart';
import 'screens/personal.dart';
import 'screens/school.dart';
import 'screens/newPersonalNote.dart';
import 'screens/newSchoolNote.dart';
import 'screens/newWorkNote.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';

class NoteApp extends StatefulWidget {
  @override
  _NoteApp createState() => _NoteApp();
}

class _NoteApp extends State<NoteApp> {
  @override
  Widget build(BuildContext context) {
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('Worknotes');
    CollectionReference school = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('Schoolnotes');
    CollectionReference personal = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('Personalnotes');
    List<Color> myColors = [
      Colors.yellow[200],
      Colors.red[200],
      Colors.green[200],
      Colors.deepPurple[200],
    ];
    final AlertDialog dialog = AlertDialog(
      content:
          Text('Please pick which category you want to write your note in'),
      actions: [
        FlatButton(
          textColor: Colors.blueAccent,
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => NewWorkNote()));
          },
          child: Text('Work'),
        ),
        FlatButton(
          textColor: Colors.blueAccent,
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => NewSchoolNote()));
          },
          child: Text('School'),
        ),
        FlatButton(
          textColor: Colors.blueAccent,
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => NewNote()));
          },
          child: Text('Personal'),
        ),
      ],
    );
    return MaterialApp(
      title: 'Speech to text App',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Homepage()));
            },
          ),
          backgroundColor: Colors.blue,
          elevation: 0.0,
          title: Text('NoteApp',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              )),

          // actions: [
          //   IconButton(
          //       icon: Icon(
          //         Icons.search,
          //         color: Colors.white,
          //       ),
          //       onPressed: () {
          //         //
          //       }),
          //   IconButton(
          //     icon: Icon(
          //       Icons.notifications,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {
          //       //
          //     },
          //   ),
          // ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Work',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 20.0),
                  ),
                  Spacer(),
                  TextButton(
                      child: Text('View All',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15.0,
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => WorkScreen()));
                      })
                ],
              ),
              FutureBuilder<QuerySnapshot>(
                  future: ref.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 100,
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              Map data = snapshot.data.docs[index].data();
                              DateTime mydateTime = data['created'].toDate();
                              String formattedTime = DateFormat.yMMMd()
                                  .add_jm()
                                  .format(mydateTime);

                              return Container(
                                width: 200,
                                // height: 250,
                                // padding: EdgeInsets.all(10),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Card(
                                  color: Colors.white,
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
                                                child: Text("Work"),
                                              ),
                                              // IconButton(
                                              //   icon: Icon(
                                              //     Icons.delete,
                                              //     color: Colors.blueAccent,
                                              //   ),
                                              //   onPressed: () {
                                              //     showDialog<void>(
                                              //         context: context,
                                              //         builder: (context) =>
                                              //             dialog);
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
                                              //         builder: (context) =>
                                              //             dialog);
                                              //   },
                                              // ),
                                              // LikeButton(),
                                            ],
                                          )
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
                                                        .reference),
                                          ));
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Text("Loading..."),
                      );
                    }
                  }),
              Row(
                children: [
                  Text(
                    'Personal',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 20.0),
                  ),
                  Spacer(),
                  TextButton(
                      child: Text('View All',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15.0,
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => PersonalScreen()));
                      })
                ],
              ),
              FutureBuilder<QuerySnapshot>(
                  future: personal.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 100,
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              Map data = snapshot.data.docs[index].data();
                              DateTime mydateTime = data['created'].toDate();
                              String formattedTime = DateFormat.yMMMd()
                                  .add_jm()
                                  .format(mydateTime);

                              return Container(
                                width: 200,
                                // height: 250,
                                // padding: EdgeInsets.all(10),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Card(
                                  color: Colors.white,
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
                                                child: Text("Personal"),
                                              ),
                                              // IconButton(
                                              //   icon: Icon(
                                              //     Icons.delete,
                                              //     color: Colors.blueAccent,
                                              //   ),
                                              //   onPressed: () {
                                              //     showDialog<void>(
                                              //         context: context,
                                              //         builder: (context) =>
                                              //             dialog);
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
                                              //         builder: (context) =>
                                              //             dialog);
                                              //   },
                                              // ),
                                              // LikeButton(),
                                            ],
                                          )
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
                                                        .reference),
                                          ));
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Text("Loading..."),
                      );
                    }
                  }),
              Row(
                children: [
                  Text(
                    'School',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 20.0),
                  ),
                  Spacer(),
                  TextButton(
                      child: Text('View All',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15.0,
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => SchoolScreen()));
                      }),
                ],
              ),
              FutureBuilder<QuerySnapshot>(
                  future: school.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 100,
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              Map data = snapshot.data.docs[index].data();
                              DateTime mydateTime = data['created'].toDate();
                              String formattedTime = DateFormat.yMMMd()
                                  .add_jm()
                                  .format(mydateTime);

                              return Container(
                                width: 200,
                                // height: 250,
                                // padding: EdgeInsets.all(10),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Card(
                                  color: Colors.white,
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
                                                child: Text("School"),
                                              ),
                                              // IconButton(
                                              //   icon: Icon(
                                              //     Icons.delete,
                                              //     color: Colors.blueAccent,
                                              //   ),
                                              //   onPressed: () {
                                              //     showDialog<void>(
                                              //         context: context,
                                              //         builder: (context) =>
                                              //             dialog);
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
                                              //         builder: (context) =>
                                              //             dialog);
                                              //   },
                                              // ),
                                              // LikeButton(),
                                            ],
                                          )
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
                                                        .reference),
                                          ));
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Text("Loading..."),
                      );
                    }
                  }),
            ],
          ),
        )),
        // drawer: Drawer(
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: [
        //       DrawerHeader(
        //         child: Center(
        //             child: Column(
        //           children: [
        //             CircleAvatar(
        //               backgroundImage: AssetImage('images/profile.png'),
        //               radius: 40.0,
        //             ),
        //             SizedBox(height: 5.0),
        //             Text('...',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                 )),
        //             SizedBox(height: 5.0),
        //             Text('@alustudent.com',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                 )),
        //           ],
        //         )),
        //         decoration: BoxDecoration(
        //           color: Colors.blue,
        //         ),
        //       ),
        //       ListTile(
        //         leading: Icon(
        //           Icons.home,
        //           color: Colors.blueAccent,
        //         ),
        //         title: Text('Home'),
        //         onTap: () {
        //           //
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         leading: Icon(
        //           Icons.person,
        //           color: Colors.blueAccent,
        //         ),
        //         title: Text('Profile'),
        //         onTap: () {
        //           //
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         leading: Icon(
        //           Icons.category,
        //           color: Colors.blueAccent,
        //         ),
        //         title: Text('Note Tag'),
        //         onTap: () {
        //           //
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         leading: Icon(
        //           Icons.settings,
        //           color: Colors.blueAccent,
        //         ),
        //         title: Text('Settings'),
        //         onTap: () {
        //           //
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         leading: Icon(
        //           Icons.logout,
        //           color: Colors.blueAccent,
        //         ),
        //         title: Text('Log out'),
        //         onTap: () {
        //           //
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Colors.blue,
        //   type: BottomNavigationBarType.fixed,
        //   selectedItemColor: Colors.white,
        //   unselectedItemColor: Colors.white,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.home,
        //         color: Colors.white,
        //       ),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.book,
        //         color: Colors.white,
        //       ),
        //       label: 'NoteBook',
        //     ),
        //     BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.check,
        //           color: Colors.white,
        //         ),
        //         label: 'To Do'),
        //   ],
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog<void>(context: context, builder: (context) => dialog)
                .then((value) {
              print("Calling Set  State !");
              setState(() {});
            });
          },
          // tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
