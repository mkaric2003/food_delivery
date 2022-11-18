// ignore_for_file: unused_import, unused_element

import 'package:app_food_delivery/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  //final GoogleSignIn googleSignIn;
  //final FirebaseAuth firebaseAuth;
  //final FirebaseFirestore firebaseFirestore;
  final SharedPreferences prefs;

  Auth({
    // required this.firebaseAuth,
    // required this.googleSignIn,
    required this.prefs,
    // required this.firebaseFirestore,
  });

  String? getUserFirebaseId() {
    return prefs.getString('id');
  }

//ovu funkciju trebam popraviti
  Future<bool> isLoggedIn() async {
    bool isLoggedIn = await GoogleSignIn().isSignedIn();
    if (isLoggedIn && prefs.getString('id')?.isNotEmpty == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> googleSignIn() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();

    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      User? firebaseUser =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          final authResult = await FirebaseAuth.instance
              .signInWithCredential(GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ));
          if (authResult.additionalUserInfo!.isNewUser) {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(authResult.user!.uid)
                .set({
              'id': authResult.user!.uid,
              'name': authResult.user!.displayName,
              'email': authResult.user!.email,
              'createdAt': Timestamp.now(),
            });
          }
        } on FirebaseException catch (error) {
          Fluttertoast.showToast(msg: error.message!);
        }
      }
      User currentUser = firebaseUser!;
      await prefs.setString('id', currentUser.uid);
      await prefs.setString('name', currentUser.displayName ?? "");
      await prefs.setString('email', currentUser.email ?? "");
    }

    notifyListeners();
  }

  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      Fluttertoast.showToast(
          msg: 'An email has been sent to your email adress',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 16);
      notifyListeners();
    } on FirebaseException catch (error) {
      //Fluttertoast.showToast(msg: error.message!);
    }
    notifyListeners();
  }

  Future<void> handleSignOut() async {
    await FirebaseAuth.instance.signOut();

    notifyListeners();
  }
}
