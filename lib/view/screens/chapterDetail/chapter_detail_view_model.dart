import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/routes/app_routes.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/view/screens/auth/auth_view_model.dart';
import 'package:pinput/pinput.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/utils/themes.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chapterDetailViewModel =
    ChangeNotifierProvider((ref) => ChapterDetailViewModel());

class ChapterDetailViewModel extends BaseViewModel<BaseScreenView> {
  void showSnackbar(String message) {
    view?.showSnackbar("wohooo!!!!");
  }

  void navigateToTest() {
    view?.navigateToScreen(AppRoute.test);
  }

  void navigateToNotes() {
    view?.navigateToScreen(AppRoute.notes);
  }
}
