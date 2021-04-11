import 'package:flutter/material.dart';
import 'newNote.dart';
// import 'package:overflown/work.dart';
// import 'package:like_button/like_button.dart';

// void main() => runApp(MaterialApp(
//       home: PersonalScreen(),
//     ));

class PersonalScreen extends StatelessWidget {
  final List<String> titles2 = [
    'Dreams can become reality',
    'Getting over life',
    'orange became my best fruit',
    'Dreams can become reality',
    'Getting over life',
    'orange became my best fruit'
  ];

  final List<String> maintext2 = [
    'The field notes were written by hand on lined paper. They consisted of jotted notes and mental triggers (personal notes that would remind me of specific things when it came to writing the notes up). I took some direct observational notes recording what I saw where this was relevant to the research questions and, as I was aiming to get a sense of the culture and working environment, I also made researcher inference notes ',
    'I found the note-taking process itself helpful, as it ensured that I listened carefully and decoded information. Not all the information I recorded was relevant but noting what I found informative contributed to my ability to form an overview on re-reading. However, the reliability of jotted notes alone can be questionable. For example, the notes were not a direct transcription of what the subjects said but consisted of pertinent or interesting information.',
    'A tape recorder would have been a better, more accurate method. However, one student brought a tape recorder and was asked to switch it off by a participant who was uneasy about her comments being directly recorded. It seems that subjects feel differently about being recorded or photographed (as opposed to observers taking notes), so specific consent should be sought before using these technologies',
    'The field notes were written by hand on lined paper. They consisted of jotted notes and mental triggers (personal notes that would remind me of specific things when it came to writing the notes up). I took some direct observational notes recording what I saw where this was relevant to the research questions and, as I was aiming to get a sense of the culture and working environment, I also made researcher inference notes ',
    'I found the note-taking process itself helpful, as it ensured that I listened carefully and decoded information. Not all the information I recorded was relevant but noting what I found informative contributed to my ability to form an overview on re-reading. However, the reliability of jotted notes alone can be questionable. For example, the notes were not a direct transcription of what the subjects said but consisted of pertinent or interesting information.',
    'A tape recorder would have been a better, more accurate method. However, one student brought a tape recorder and was asked to switch it off by a participant who was uneasy about her comments being directly recorded. It seems that subjects feel differently about being recorded or photographed (as opposed to observers taking notes), so specific consent should be sought before using these technologies'
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
          title: Text('NoteBook:Personal',
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
                                    child: Center(child: Text('Personal.')),
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
