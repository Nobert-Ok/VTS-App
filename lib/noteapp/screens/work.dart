import 'package:flutter/material.dart';
import 'newNote.dart';
// import 'package:overflown/work.dart';
// import 'package:like_button/like_button.dart';

// void main() => runApp(MaterialApp(
//       home: WorkScreen(),
//     ));

class WorkScreen extends StatelessWidget {
  final List<String> titles3 = [
    'Having a hectic day at work',
    'Convincing my boss about a task',
    'Getting to know my fellow employees',
    'Having a hectic day at work',
    'Convincing my boss about a task',
    'Getting to know my fellow employees',
  ];

  final List<String> maintext3 = [
    'The two inventors (an odd name considering that, as Smith (2002) says, nobody thinks of things in a vacuum) were accompanied by their marketing people. The conversations were quite contrived, but also funny and enlightening. I realised that the marketing people used a certain form of evidence to persuade the viewers (us?) of the value of the inventions',
    'To them, this value was determined solely by whether something could be bought or sold—in other words, whether something was marketable. In contrast, the inventors seemed quite shy and reluctant to use anything more than technical language, almost as if this was the only evidence required – as if no further explanation was needed',
    'This difference forced me to reflect on the aims of this course—how communication skills are not generic but differ according to time and place. Like in the "Research Methodology" textbook discussed in the first lecture, these communication skills are the result of a form of triangulation,  ',
    'The two inventors (an odd name considering that, as Smith (2002) says, nobody thinks of things in a vacuum) were accompanied by their marketing people. The conversations were quite contrived, but also funny and enlightening. I realised that the marketing people used a certain form of evidence to persuade the viewers (us?) of the value of the inventions',
    'To them, this value was determined solely by whether something could be bought or sold—in other words, whether something was marketable. In contrast, the inventors seemed quite shy and reluctant to use anything more than technical language, almost as if this was the only evidence required – as if no further explanation was needed',
    'This difference forced me to reflect on the aims of this course—how communication skills are not generic but differ according to time and place. Like in the "Research Methodology" textbook discussed in the first lecture, these communication skills are the result of a form of triangulation,  '
  ];

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
      title: 'Speech to text App',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.blue,
          elevation: 0.0,
          title: Text('NoteBook:Work',
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        body: Container(
            padding: EdgeInsets.all(10.0),
            child: GridView.builder(
              itemCount: titles3.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
              itemBuilder: (BuildContext context, int index) {
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
                      color: Colors.white,
                      elevation: 5.0,
                      child: InkWell(
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(children: [
                              Text(
                                titles3[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  maintext3[index],
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
                                      border:
                                          Border.all(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    // decoration: ShapeDecoration(
                                    //   shape: RoundedRectangleBorder(
                                    //     borderRadius: BorderRadius.circular(50),
                                    //   ),
                                    // ),
                                    child: Text('Work'),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.blueAccent,
                                    ),
                                    onPressed: () {
                                      showDialog<void>(
                                          context: context,
                                          builder: (context) => dialog);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blueAccent,
                                    ),
                                    onPressed: () {
                                      showDialog<void>(
                                          context: context,
                                          builder: (context) => dialog);
                                    },
                                  ),
                                  // LikeButton(),
                                ],
                              ),
                            ])),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    FullScreenDialogue(
                                        titles3[index], maintext3[index]),
                                fullscreenDialog: true,
                              ));
                        },
                      ),
                    ));

                // Image.network(images[index]);
              },
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
        //             Text('Neba Roland Ngwa',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                 )),
        //             SizedBox(height: 5.0),
        //             Text('n.ngwa@alustudent.com',
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
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => NewNote()));
          },
          child: Icon(Icons.add),
        ),
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
