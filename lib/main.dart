import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voice_app/model/database.dart';
import 'package:voice_app/qrcode/main.dart';
import 'noteapp/mainnote.dart';
import 'signup.dart';
import 'login.dart';
import 'home.dart';
import 'todo.dart';
// import 'noteapp/mainnote.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Database>(create: (_) => Database())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: <String, WidgetBuilder>{
            '/signup': (BuildContext context) => new SignupPage(),
            '/login': (BuildContext context) => new Login(),
            '/home': (BuildContext context) => new Homepage(),
            '/todo': (BuildContext context) => new Todolist(),
            '/note': (BuildContext context) => new NoteApp(),
            '/qrcode': (BuildContext context) => new Qrcode(),
            // '/signup': (BuildContext context) => new SignupPage()
          },
          theme:
              ThemeData(primarySwatch: Colors.blue, fontFamily: "Montserrat"),
          home: new MyHomePage(),
        ));
  }
}
