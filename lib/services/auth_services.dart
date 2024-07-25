//TODO: Implement Authentication Services Logics here

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn? googleSignIn;

  bool get isSignedIn => _auth.currentUser != null ? true : false;

  FirebaseAuth get auth => _auth;

  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn!.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      if (user != null) {
        return user;
      } else {
        return null;
      }
    } on PlatformException catch (e) {
      log(e.message.toString());
      return null;
    }
  }
}
