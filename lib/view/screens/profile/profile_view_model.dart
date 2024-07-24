import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/routes/app_routes.dart';

final profileViewModel = ChangeNotifierProvider((ref) => ProfileViewModel());

class ProfileViewModel extends BaseViewModel<BaseScreenView> {
  void showSnackbar(String message) {
    view?.showSnackbar("wohooo!!!!");
  }

  void navigateToSubscription() {
    view?.navigateToScreen(AppRoute.subscribe);
  }
}
