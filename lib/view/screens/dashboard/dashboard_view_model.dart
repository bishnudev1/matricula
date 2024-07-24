import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/routes/app_routes.dart';

final dashboardViewModel =
    ChangeNotifierProvider((ref) => DashboardViewModel());

class DashboardViewModel extends BaseViewModel<BaseScreenView> {
  void showSnackbar(String message) {
    view?.showSnackbar("wohooo!!!!");
  }

  void navigateToLogin() {
    view?.navigateToScreen(AppRoute.login);
  }

  void navigateToprofile() {
    view?.navigateToScreen(AppRoute.profile);
  }

  void navigateToChapters() {
    view?.navigateToScreen(AppRoute.chapter);
  }

  dynamic Function()? navigate(int index) {
    switch (index) {
      case 0:
        view?.navigateToScreen(AppRoute.library);

        break;
      case 1:
        view?.navigateToScreen(AppRoute.download);

        break;
      // case 2:
      //   view?.navigateToScreen(AppRoute.liveClass);

      //   break;
      case 3:
        view?.navigateToScreen(AppRoute.progress);

        break;
      case 4:
        view?.navigateToScreen(AppRoute.subscribe);

        break;
      case 5:
        view?.navigateToScreen(AppRoute.refer);

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
