import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';

final profileViewModel = ChangeNotifierProvider((ref) => ProfileViewModel());

class ProfileViewModel extends BaseViewModel<BaseScreenView> {
  void showSnackbar(String message) {
    // view?.showSnackbar("wohooo!!!!");
  }

  void navigateToSubscription() {
    // view?.navigateToScreen(AppRoute.subscribe);
  }
  User? _user;

  User get user => _user!;

  ProfileViewModel() {
    _user = FirebaseAuth.instance.currentUser;
    log("User: ${_user!.displayName}");
  }
}
