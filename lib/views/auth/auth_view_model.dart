import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/app/app_routes.dart';
import 'package:matricula/providers/auth_providers.dart';
import 'package:matricula/utils/navigate.dart';
import 'package:matricula/utils/showtoast.dart';

final authViewModel = ChangeNotifierProvider((ref) => AuthViewModel());
// final authProviders = Provider<AuthServices>((ref) => AuthServices());

class AuthViewModel extends BaseViewModel<BaseScreenView> {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void showSnackbar(String message, BuildContext context) {
    showToast("wohooo!!!!", context);
  }

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
}
