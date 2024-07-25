import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';

final mainScreenProvider =
    ChangeNotifierProvider((ref) => MainScreenViewModel());

class MainScreenViewModel extends BaseViewModel<BaseScreenView> {
  User? _user;

  User get user => _user!;

  MainScreenViewModel() {
    _user = FirebaseAuth.instance.currentUser;
    log("User: ${_user!.displayName}");
  }
}
