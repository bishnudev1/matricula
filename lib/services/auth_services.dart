//TODO: Implement Authentication Services Logics here

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:matricula/utils/showtoast.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn? googleSignIn;

  bool get isSignedIn => _auth.currentUser != null ? true : false;

  String _verificationId = '';
  int? otpResendToken;

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
      log(user!.photoURL.toString());
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
        log(user!.photoURL.toString());
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
      if (FacebookAuth.instance != null) {
        await FacebookAuth.instance.logOut();
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

  Future<User?> handleSentPhoneOtp({
    required String phoneNumber,
    required VoidCallback onVerificationSuccess,
    required BuildContext context,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        forceResendingToken: otpResendToken,
        timeout: const Duration(seconds: 0),
        verificationCompleted: (PhoneAuthCredential credential) async {
          onOtpVerification(credential,
              onVerificationSuccess: onVerificationSuccess, context: context);
        },
        verificationFailed: (FirebaseAuthException e) {
          log("@OTP sign in failed : ${e.message}");

          if (e.code == 'invalid-phone-number') {
            showToast('The provided phone number is not valid.', context);
            return;
          }

          showToast("OTP Sign In failed, Try again!", context);
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          otpResendToken = resendToken;
          showToast("OTP sent successfully", context);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return null;
    } on PlatformException catch (e) {
      showToast(e.code.toString(), context);
    } on FirebaseAuthException catch (e) {
      showToast(e.code.toString(), context);
      print("********${e.message}*********");
    } catch (e) {
      showToast("Network Error! Try again", context);
      log(e.toString());
      return null;
    }
    return null;
  }

  Future<User?> handlePhoneOtpVerify({
    required String otp,
    required VoidCallback onVerificationSuccess,
    required BuildContext context,
  }) async {
    try {
      if (_verificationId.isEmpty || otp.isEmpty) {
        showToast("Please enter the OTP", context);
        return null;
      }
      log("OTP: $otp");

      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      );

      await onOtpVerification(credential,
          onVerificationSuccess: onVerificationSuccess, context: context);
      return null;
    } on PlatformException catch (e) {
      showToast(e.code.toString(), context);
    } on FirebaseAuthException catch (e) {
      showToast(e.code.toString(), context);
      print("********${e.message}*********");
    } catch (e) {
      log(e.toString());
      showToast("Network Error!", context);
      return null;
    }
    return null;
  }

  onOtpVerification(
    PhoneAuthCredential credential, {
    required VoidCallback onVerificationSuccess,
    required BuildContext context,
  }) async {
    try {
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final firebaseUser = authResult.user;

      log("@auth services user: $firebaseUser");

      if (firebaseUser == null) {
        showToast("OTP verification failed, Try again!", context);
        return;
      }

      // Successful verification
      onVerificationSuccess();

      return firebaseUser;
    } on PlatformException catch (e) {
      showToast(e.code.toString(), context);
    } on FirebaseAuthException catch (e) {
      showToast(e.code.toString(), context);
      print("********${e.message}*********");
    } catch (e) {
      log(e.toString());
      showToast("Network Error!", context);
      return null;
    }
  }
}
