import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/app/app_routes.dart';
import 'package:matricula/models/user_model.dart';
import 'package:matricula/providers/auth_providers.dart';
import 'package:matricula/utils/navigate.dart';
import 'package:matricula/utils/showtoast.dart';

final authViewModel = ChangeNotifierProvider((ref) => AuthViewModel());
// final authProviders = Provider<AuthServices>((ref) => AuthServices());

class AuthViewModel extends BaseViewModel<BaseScreenView> {
  bool _isLoading = false;

  bool _isOtpReceived = false;

  bool get isOtpReceived => _isOtpReceived;

  void setOtpReceived(bool value) {
    _isOtpReceived = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  void showSnackbar(String message, BuildContext context) {
    showToast("wohooo!!!!", context);
  }

  final phoneNumberEditingController = TextEditingController();
  final otpEditingController = TextEditingController();

  TextEditingController get phoneNumberController =>
      phoneNumberEditingController;
  TextEditingController get otpController => otpEditingController;

  void navigateToLogin(BuildContext context) {
    navigateToScreen(AppRoute.login, context);
  }

  void navigateToRegistration(BuildContext context) {
    navigateToScreen(AppRoute.registration, context);
  }

  void navigateTodashboard(BuildContext context) {
    navigateToScreen(AppRoute.mainScreenView, context);
  }

  void navigateToForgetPassword(BuildContext context) {
    navigateToScreen(AppRoute.forgetPassword, context);
  }

  void handleGoogleSignIn(BuildContext context, WidgetRef ref) async {
    if (isLoading) return;

    try {
      _isLoading = true;
      notifyListeners();
      log("isLoading start: $_isLoading");

      final auth = ref.read(authProviders);
      final user = await auth.signInWithGoogle(context);

      if (user != null) {
        log("User: ${user.displayName}");
        showToast("Google login successful", context);
      } else {
        showToast("Google login failed", context);
      }
    } on PlatformException catch (e) {
      log("PlatformException: ${e.message}");
    } on FirebaseException catch (e) {
      log("FirebaseException: ${e.message}");
    } finally {
      _isLoading = false;
      notifyListeners();
      log("isLoading end: $isLoading");
    }
  }

  void handleFacebookSignIn(BuildContext context, WidgetRef ref) async {
    if (isLoading) return;

    try {
      _isLoading = true;
      notifyListeners();
      log("isLoading start: $_isLoading");

      final auth = ref.read(authProviders);
      final user = await auth.signInWithFacebook(context);

      if (user != null) {
        log("User: ${user.displayName}");
        showToast("Facebook login successful", context);
      } else {
        showToast("Facebook login failed", context);
      }
    } on PlatformException catch (e) {
      log("PlatformException: ${e.message}");
    } on FirebaseException catch (e) {
      log("FirebaseException: ${e.message}");
    } finally {
      _isLoading = false;
      notifyListeners();
      log("isLoading end: $isLoading");
    }
  }

  sendPhoneOtp(BuildContext context, WidgetRef ref) async {
    if (isLoading) return;
    try {
      await ref.read(authProviders).handleSentPhoneOtp(
          phoneNumber: "+91${phoneNumberEditingController.text}",
          onVerificationSuccess: () {
            log("OTP verification successful, navigating to phoneOtp screen");
            // navigateToScreen(AppRoute.phoneOtp, context);
          },
          context: context);
    } on PlatformException catch (e) {
      log("PlatformException: ${e.message}");
    } on FirebaseException catch (e) {
      log("FirebaseException: ${e.message}");
    } finally {
      _isLoading = false;
      notifyListeners();
      log("isLoading end: $isLoading");
    }
  }

  verifyPhoneOtp(String pin, BuildContext context, WidgetRef ref) async {
    log("Pin Code is: $pin");
    if (isLoading) return;
    try {
      await ref.read(authProviders).handlePhoneOtpVerify(
          otp: pin,
          onVerificationSuccess: () async {
            log("OTP verified successfully, navigating to mainScreenView");
            // setOtpReceived(false);
            final userBox = Hive.box<UserModel>('user');
            await userBox.clear();
            UserModel data = UserModel(
              uid: FirebaseAuth.instance.currentUser!.uid,
              displayName: "Anonymous",
              email: "",
              phoneNumber: FirebaseAuth.instance.currentUser!.phoneNumber,
              photoURL:
                  "https://img.freepik.com/free-vector/user-circles-set_78370-4704.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1721433600&semt=sph",
            );
            await userBox.add(data);
            log("User: ${data.displayName}");
            context.go('/mainScreenView');
          },
          context: context);
    } on PlatformException catch (e) {
      log("PlatformException: ${e.message}");
    } on FirebaseException catch (e) {
      log("FirebaseException: ${e.message}");
    } finally {
      _isLoading = false;
      phoneNumberEditingController.clear();
      otpEditingController.clear();
      notifyListeners();
      log("isLoading end: $isLoading");
    }
  }

  // onVerificationSuccess() {
  //   log("Verification Success");
  //   setOtpReceived(false);
  //   notifyListeners();
  // }
}
