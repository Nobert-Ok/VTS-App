import 'package:flutter/material.dart';

import 'package:quiver/iterables.dart';

import 'screens/work.dart';
import 'screens/personal.dart';
import 'screens/school.dart';
import 'screens/newNote.dart';
// import 'package:like_button/like_button.dart';

// void main() => runApp(MaterialApp(
//       home: NoteApp(),
//     ));

class NoteApp extends StatelessWidget {
  final work = 'Work';
  final personal = 'Personal';
  final school = 'School';
  final List<String> titles1 = [
    'Dreams can become reality',
    'Getting over life',
    'orange became my best fruit'
  ];
  final List<String> titles2 = [
    'Meeting the new facilitator',
    'My day at School today',
    'Meeting new people at School'
  ];
  final List<String> titles3 = [
    'Having a hectic day at work',
    'Convincing my boss about a task',
    'Getting to know my fellow employees'
  ];

  final List<String> maintext1 = [
    'The field notes were written by hand on lined paper. They consisted of jotted notes and mental triggers (personal notes that would remind me of specific things when it came to writing the notes up). I took some direct observational notes recording what I saw where this was relevant to the research questions and, as I was aiming to get a sense of the culture and working environment, I also made researcher inference notes ',
    'I found the note-taking process itself helpful, as it ensured that I listened carefully and decoded information. Not all the information I recorded was relevant but noting what I found informative contributed to my ability to form an overview on re-reading. However, the reliability of jotted notes alone can be questionable. For example, the notes were not a direct transcription of what the subjects said but consisted of pertinent or interesting information.',
    'A tape recorder would have been a better, more accurate method. However, one student brought a tape recorder and was asked to switch it off by a participant who was uneasy about her comments being directly recorded. It seems that subjects feel differently about being recorded or photographed (as opposed to observers taking notes), so specific consent should be sought before using these technologies'
  ];
  final List<String> maintext2 = [
    'Question: Discuss at least two things you learnt or discovered – for example about design or working in groups or the physical world – through participating in the Impromptu Design activities.',
    'I learned that good teamwork is the key to success in design activities when time and resources are limited. As everyone had their own point of view, many different ideas could be produced, and I found the energy of group participation made me feel more energetic about contributing something',
    'I learned that every design has its weaknesses and strengths and working with a group can help discover what they are. We challenged each other"s preconceptions about what would and would not work. We could also see the reality of the way changing a design actually affected its performance.'
  ];
  final List<String> maintext3 = [
    'The two inventors (an odd name considering that, as Smith (2002) says, nobody thinks of things in a vacuum) were accompanied by their marketing people. The conversations were quite contrived, but also funny and enlightening. I realised that the marketing people used a certain form of evidence to persuade the viewers (us?) of the value of the inventions',
    'To them, this value was determined solely by whether something could be bought or sold—in other words, whether something was marketable. In contrast, the inventors seemed quite shy and reluctant to use anything more than technical language, almost as if this was the only evidence required – as if no further explanation was needed',
    'This difference forced me to reflect on the aims of this course—how communication skills are not generic but differ according to time and place. Like in the "Research Methodology" textbook discussed in the first lecture, these communication skills are the result of a form of triangulation,  '
  ];

  Widget method1(BuildContext context, List<String> titles,
      List<String> maintext, String categorry) {
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
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 100,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (var item in zip([titles, maintext]))
              Container(
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
                            item[0],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              item[1],
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
                                  border: Border.all(color: Colors.blueAccent),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                // decoration: ShapeDecoration(
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(50),
                                //   ),
                                // ),
                                child: Text(categorry),
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
                          )
                        ])),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                FullScreenDialogue(item[0], item[1]),
                            fullscreenDialog: true,
                          ));
                    },
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              method1(context, titles3, maintext3, work),
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
              method1(context, titles1, maintext1, personal),
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
              method1(context, titles2, maintext2, school),
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
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => NewNote()));
          },
          // tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class FullScreenDialogue extends StatelessWidget {
  FullScreenDialogue(this.titleD, this.tbody);
  // FullScreenDialogue(this.tbody);
  final String tbody;
  final String titleD;
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
