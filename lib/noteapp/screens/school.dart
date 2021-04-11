import 'package:flutter/material.dart';
import 'newNote.dart';
// import 'package:like_button/like_button.dart';

// void main() => runApp(MaterialApp(
//       home: SchoolScreen(),
//     ));

class SchoolScreen extends StatelessWidget {
  final List<String> titles2 = [
    'Meeting the new facilitator',
    'My day at School today',
    'Meeting new people at School',
    'Meeting the new facilitator',
    'My day at School today',
    'Meeting new people at School'
  ];

  final List<String> maintext2 = [
    'Question: Discuss at least two things you learnt or discovered – for example about design or working in groups or the physical world – through participating in the Impromptu Design activities.',
    'I learned that good teamwork is the key to success in design activities when time and resources are limited. As everyone had their own point of view, many different ideas could be produced, and I found the energy of group participation made me feel more energetic about contributing something',
    'I learned that every design has its weaknesses and strengths and working with a group can help discover what they are. We challenged each other"s preconceptions about what would and would not work. We could also see the reality of the way changing a design actually affected its performance.',
    'Question: Discuss at least two things you learnt or discovered – for example about design or working in groups or the physical world – through participating in the Impromptu Design activities.',
    'I learned that good teamwork is the key to success in design activities when time and resources are limited. As everyone had their own point of view, many different ideas could be produced, and I found the energy of group participation made me feel more energetic about contributing something',
    'I learned that every design has its weaknesses and strengths and working with a group can help discover what they are. We challenged each other"s preconceptions about what would and would not work. We could also see the reality of the way changing a design actually affected its performance.'
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
          title: Text('NoteBook:School',
              style: TextStyle(
                color: Colors.white,
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
        body: Container(
            padding: EdgeInsets.all(10.0),
            child: GridView.builder(
              itemCount: titles2.length,
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
                                titles2[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  maintext2[index],
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
                                    child: Text('Schoo..'),
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
                                        titles2[index], maintext2[index]),
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
