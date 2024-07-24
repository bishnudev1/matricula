import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/utils/showtoast.dart';

final testViewModel = ChangeNotifierProvider((ref) => TestViewModel());

class TestViewModel extends BaseViewModel<BaseScreenView> {
  void showSnackbar(String message, BuildContext context) {
    // view?.showSnackbar(message);
    showToast(message, context);
  }

  void navigateToTest() {
    // view?.navigateToScreen(AppRoute.test);
  }
}
