import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/routes/app_routes.dart';

final testViewModel = ChangeNotifierProvider((ref) => TestViewModel());

class TestViewModel extends BaseViewModel<BaseScreenView> {
  void showSnackbar(String message) {
    view?.showSnackbar("wohooo!!!!");
  }

  void navigateToTest() {
    view?.navigateToScreen(AppRoute.test);
  }
}
