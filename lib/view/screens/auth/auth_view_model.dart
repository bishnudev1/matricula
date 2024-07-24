import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/routes/app_routes.dart';

final authViewModel = ChangeNotifierProvider((ref) => AuthViewModel());

class AuthViewModel extends BaseViewModel<BaseScreenView> {
  void showSnackbar(String message) {
    view?.showSnackbar("wohooo!!!!");
  }

  void navigateToLogin() {
    view?.navigateToScreen(AppRoute.login);
  }

  void navigateToRegistration() {
    view?.navigateToScreen(AppRoute.registration);
  }

  void navigateTodashboard() {
    view?.navigateToScreen(AppRoute.mainScreenView);
  }

  void navigateToForgetPassword() {
    view?.navigateToScreen(AppRoute.forgetPassword);
  }
}
