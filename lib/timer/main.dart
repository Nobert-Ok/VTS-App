import 'dart:io';

import 'package:flutter/material.dart';
import '../home.dart';
import 'timer.dart';

class BaseApp extends StatefulWidget {
  @override
  _BaseAppState createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  String _title = 'Pomodoro Timer';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Text("Pomodoro Timer"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Homepage()));
              },
            ),
          ),
          body: Builder(
            builder: (context) => Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: FittedBox(
                child: TimerWidget(
                  duration: Duration(minutes: 25),
                  tick: Duration(milliseconds: 250),
                  onTick: (String countdown) =>
                      setState(() => _title = countdown),
                ),
              ),
            ),
          ),
        ),
      );
}
