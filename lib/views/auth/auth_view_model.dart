import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/app/app_routes.dart';
import 'package:matricula/providers/auth_providers.dart';
import 'package:matricula/services/auth_services.dart';
import 'package:matricula/utils/navigate.dart';
import 'package:matricula/utils/showtoast.dart';

final authViewModel = ChangeNotifierProvider((ref) => AuthViewModel());
// final authProviders = Provider<AuthServices>((ref) => AuthServices());

class AuthViewModel extends BaseViewModel<BaseScreenView> {
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
    final auth = ref.read(authProviders);
    final user = await auth.signInWithGoogle(context);
    if (user != null) {
      log("User: ${user.displayName}");
      showToast("Google login has successfully", context);
      // navigateTodashboard(context);
    } else {
      showToast("Google login failed", context);
    }
  }
}
