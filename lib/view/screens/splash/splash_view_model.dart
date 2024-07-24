import 'package:flutter/material.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/routes/app_routes.dart';

class SplashViewModel extends BaseViewModel<BaseScreenView> {
  void showSnackbar(String message) {
    view?.showSnackbar(message);
  }

  void navigateToSecondScreen() {
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => view?.navigateToScreen(AppRoute.login));
  }
}
