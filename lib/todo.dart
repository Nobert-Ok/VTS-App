import 'package:flutter/material.dart';
import 'package:voice_app/home.dart';
import 'package:voice_app/pages/add_event_page.dart';
import 'package:voice_app/pages/add_task_page.dart';
import 'package:voice_app/pages/event_page.dart';
import 'package:voice_app/pages/task_page.dart';
import 'package:voice_app/widgets/custom_button.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Todolist extends StatefulWidget {
  @override
  _TodolistState createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  DateFormat dateFormat;
  DateFormat timeFormat;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = new DateFormat.yMMMMd('cs');
    timeFormat = new DateFormat.Hms('cs');
  }

  PageController _pageController = PageController();

  double currentPage = 0;

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 35,
            color: Theme.of(context).accentColor,
          ),
          Positioned(
            right: 0,
            child: Text(
              DateFormat('d').format(DateTime.now()),
              style: TextStyle(fontSize: 180, color: Color(0x10000000)),
            ),
          ),
          _mainContent(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                    child: currentPage == 0 ? AddTaskPage() : AddEventPage(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))));
              });
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Homepage()));
              },
            ),
            // IconButton(
            //   icon: Icon(Icons.more_vert),
            //   onPressed: () {},
            // )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _mainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            DateFormat('EEEE').format(DateTime.now()),
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: _button(context),
        ),
        Expanded(
            child: PageView(
          controller: _pageController,
          children: <Widget>[TaskPage(), EventPage()],
        ))
      ],
    );
  }

  Widget _button(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: CustomButton(
          onPressed: () {
            _pageController.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut);
          },
          buttonText: "Tasks",
          color:
              currentPage < 0.5 ? Theme.of(context).accentColor : Colors.white,
          textColor:
              currentPage < 0.5 ? Colors.white : Theme.of(context).accentColor,
          borderColor: currentPage < 0.5
              ? Colors.transparent
              : Theme.of(context).accentColor,
        )),
        SizedBox(
          width: 32,
        ),
        // Expanded(
        //     child: CustomButton(
        //   onPressed: () {
        //     _pageController.nextPage(
        //         duration: Duration(milliseconds: 500),
        //         curve: Curves.bounceInOut);
        //   },
        //   buttonText: "Events",
        //   color:
        //       currentPage > 0.5 ? Theme.of(context).accentColor : Colors.white,
        //   textColor:
        //       currentPage > 0.5 ? Colors.white : Theme.of(context).accentColor,
        //   borderColor: currentPage > 0.5
        //       ? Colors.transparent
        //       : Theme.of(context).accentColor,
        // ))
      ],
    );
  }
}
