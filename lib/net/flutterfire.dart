import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return true;
  } catch (e) {
    displayToastMsg("Invalid login inputs!");
    return false;
  }
}

displayToastMsg(String message) {
  Fluttertoast.showToast(msg: message);
}
