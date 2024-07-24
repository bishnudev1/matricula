import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/routes/app_routes.dart';
import 'package:matricula/utils/navigate.dart';
import 'package:matricula/utils/showtoast.dart';

final dashboardViewModel =
    ChangeNotifierProvider((ref) => DashboardViewModel());

class DashboardViewModel extends BaseViewModel<BaseScreenView> {
  void showSnackbar(String message, BuildContext context) {
    // view?.showSnackbar("wohooo!!!!");
    showToast(message, context);
  }

  void navigateToLogin(BuildContext context) {
    navigateToScreen(AppRoute.login, context);
  }

  void navigateToprofile(BuildContext context) {
    navigateToScreen(AppRoute.profile, context);
  }

  void navigateToChapters(BuildContext context) {
    navigateToScreen(AppRoute.chapter, context);
  }

  dynamic Function()? navigate(int index, BuildContext? context) {
    switch (index) {
      case 0:
        navigateToScreen(AppRoute.library, context!);

        break;
      case 1:
        navigateToScreen(AppRoute.download, context!);

        break;
      // case 2:
      //   view?.navigateToScreen(AppRoute.liveClass);

      //   break;
      case 3:
        navigateToScreen(AppRoute.progress, context!);

        break;
      case 4:
        navigateToScreen(AppRoute.subscribe, context!);

        break;
      case 5:
        navigateToScreen(AppRoute.refer, context!);

        break;
      // case 4:
      //   view?.navigateToScreen(AppRoute.subscribe);

      //   break;

      default:
        () {};
    }
    return null;
  }
}
