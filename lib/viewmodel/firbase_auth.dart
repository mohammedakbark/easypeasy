import 'package:easypeasy/view/login_page.dart';
import 'package:easypeasy/view/widgets/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuths {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  UserCredential? userCredential;

  sign(email, password, context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage())));
      _showDiolog("Account created successfullu",context);
    } catch (e) {
      _showDiolog("$e", context);
    }
  }

  login(email, password, context) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => _showDiolog("Login Successful",context))
          .then((value) => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage())));
    } catch (e) {
      _showDiolog("$e", context);
      
    }
  }

  // emailVarification(context) async {
  //   try {
  //     final user = FirebaseAuth.instance.currentUser;

  //     if (user != null && !user.emailVerified) {
  //       await user.sendEmailVerification().then((value) => _showDiolog(
  //           "Varification email Send to your registered email address ${user.email} ",
  //           context));
  //       if (user.emailVerified == true) {
  //         // Navigator.push(
  //         //     context, MaterialPageRoute(builder: (context) => LoginPage()));
  //         showtoast("Verification completed");

  //         print(
  //             "verification completed ///////////////////////////////////////////////");
  //       }
  //     }
  //   } catch (e) {
  //     print('Error sending verification email: $e');
  //   }
  // }

  signWithGoogle(context) async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? gAuth = await gUser!.authentication;
    final Credential = GoogleAuthProvider.credential(
        accessToken: gAuth!.accessToken, idToken: gAuth.idToken);
    return await FirebaseAuth.instance
        .signInWithCredential(Credential)
        .then((value) => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage())))
        .then((value) => _showDiolog("google sign successful", context));
  }
}



_showDiolog(String title, context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      content: Text("$title"),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"))
      ],
    ),
  );
}
// void showToast(String msg, {int? duration, int? gravity}) {
   
//   }