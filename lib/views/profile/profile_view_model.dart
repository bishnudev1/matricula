import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/models/user_model.dart';

final profileViewModel = ChangeNotifierProvider((ref) => ProfileViewModel());

class ProfileViewModel extends BaseViewModel<BaseScreenView> {
  void showSnackbar(String message) {
    // view?.showSnackbar("wohooo!!!!");
  }

  void navigateToSubscription() {
    // view?.navigateToScreen(AppRoute.subscribe);
  }
  UserModel? _user;

  UserModel? get user => _user;

  ProfileViewModel() {
    log("MainScreenViewModel is created");
    getUser();
    notifyListeners();
  }

  getUser() {
    var userBox = Hive.box<UserModel>('user');

    if (userBox.getAt(0) == null) {
      log("Local database is empty");
      var data = FirebaseAuth.instance.currentUser;
      if (data == null) {
        log("Online database is empty");
        return;
      }
      var user = userBox.add(
        UserModel(
          displayName: data!.displayName!,
          email: data.email!,
          photoURL: data.photoURL!,
          uid: data.uid,
          phoneNumber: "",
        ),
      );
      _user = user as UserModel?;
      notifyListeners();
    } else {
      _user = userBox.getAt(0);
    }
  }
}
