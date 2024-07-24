import 'package:flutter/material.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/app/app_routes.dart';
import 'package:matricula/utils/navigate.dart';
import 'package:matricula/utils/showtoast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chapterDetailViewModel =
    ChangeNotifierProvider((ref) => ChapterDetailViewModel());

class ChapterDetailViewModel extends BaseViewModel<BaseScreenView> {
  void showSnackbar(String message, BuildContext context) {
    // view?.showSnackbar("wohooo!!!!");
    showToast(message, context);
  }

  void navigateToTest(BuildContext context) {
    navigateToScreen(AppRoute.test, context);
  }

  void navigateToNotes(BuildContext context) {
    navigateToScreen(AppRoute.notes, context);
  }
}
