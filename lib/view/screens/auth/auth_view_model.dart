import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/routes/app_routes.dart';
import 'package:matricula/utils/navigate.dart';
import 'package:matricula/utils/showtoast.dart';

final authViewModel = ChangeNotifierProvider((ref) => AuthViewModel());

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
}
