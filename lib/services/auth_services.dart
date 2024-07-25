//TODO: Implement Authentication Services Logics here

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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
        context.go('/mainScreenView');
        return user;
      } else {
        return null;
      }
    } on PlatformException catch (e) {
      log(e.message.toString());
      return null;
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<User?> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(result.accessToken!.tokenString);
        final UserCredential authResult =
            await _auth.signInWithCredential(facebookAuthCredential);
        final User? user = authResult.user;
        if (user != null) {
          context.go('/mainScreenView');
          return user;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } on PlatformException catch (e) {
      log(e.message.toString());
      return null;
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      if (googleSignIn != null) {
        await googleSignIn!.signOut();
      }
      context.go('/login');
    } on PlatformException catch (e) {
      log(e.message.toString());
      return null;
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
