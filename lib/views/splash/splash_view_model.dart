import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/app/app_routes.dart';
import 'package:matricula/providers/auth_providers.dart';
import 'package:matricula/utils/navigate.dart';
import 'package:matricula/utils/showtoast.dart';

final splashViewModelProvider =
    ChangeNotifierProvider((ref) => SplashViewModel());

class SplashViewModel extends BaseViewModel<BaseScreenView> {
  void showSnackbar(String message, BuildContext context) {
    // view?.showSnackbar(message);
    showToast(message, context);
  }

  void navigateToSecondScreen(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 3)).then((value) => {
          ref.read(authProviders).isSignedIn
              ? navigateToScreen(AppRoute.mainScreenView, context)
              : navigateToScreen(AppRoute.login, context)
        });
  }
}
