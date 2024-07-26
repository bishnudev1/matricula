import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/app/app_routes.dart';
import 'package:matricula/providers/auth_providers.dart';
import 'package:matricula/utils/navigate.dart';
import 'package:matricula/utils/showtoast.dart';

import '../../models/user_model.dart';

final dashboardViewProviders =
    ChangeNotifierProvider((ref) => DashboardViewModel());

class DashboardViewModel extends BaseViewModel<BaseScreenView> {
  bool isLoading = false;

  UserModel? _user;

  UserModel? get user => _user;

  DashboardViewModel() {
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

  void showSnackbar(String message, BuildContext context) {
    // view?.showSnackbar("wohooo!!!!");
    showToast(message, context);
  }

  void navigateToLogin(BuildContext context) {
    navigateToScreen(AppRoute.login, context);
  }

  void navigateToprofile(BuildContext context) {
    navigateToScreen(AppRoute.profile, context);
  }

  void navigateToChapters(BuildContext context) {
    navigateToScreen(AppRoute.chapter, context);
  }

  void handleSignOut(BuildContext context, WidgetRef ref) async {
    log("Called signout");
    if (isLoading) {
      return;
    }
    try {
      isLoading = true;
      notifyListeners();
      final auth = ref.read(authProviders);
      await auth.signOut(context);
    } on PlatformException catch (e) {
      log(e.message.toString());
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  dynamic Function()? navigate(int index, BuildContext? context) {
    switch (index) {
      case 0:
        navigateToScreen(AppRoute.library, context!);

        break;
      case 1:
        navigateToScreen(AppRoute.download, context!);

        break;
      // case 2:
      //   view?.navigateToScreen(AppRoute.liveClass);

      //   break;
      case 3:
        navigateToScreen(AppRoute.progress, context!);

        break;
      case 4:
        navigateToScreen(AppRoute.subscribe, context!);

        break;
      case 5:
        navigateToScreen(AppRoute.refer, context!);

        break;

      default:
        () {};
    }
    return null;
  }
}
