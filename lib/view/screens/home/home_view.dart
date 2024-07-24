import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matricula/domain/providers/theme_provider.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/routes/app_routes.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/utils/translations.dart';
import 'package:matricula/view/screens/auth/auth_view_model.dart';
import 'package:pinput/pinput.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/utils/themes.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'home_view_model.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with BaseScreenView {
  late final HomeViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(homeViewModel);
    _viewModel.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(),
          ElevatedButton(
            onPressed: () {
              context.setLocale(const Locale('en'));
            },
            child: Text(Strings.english),
          ),
          gapH16,
          ElevatedButton(
            onPressed: () {
              context.setLocale(const Locale('hi'));
            },
            child: Text(Strings.hindi),
          ),
          gapH16,
          ElevatedButton(
            onPressed: () {
              _viewModel.showSnackbar("wohooo!!!!");
            },
            child: Text(Strings.showSnackbar),
          ),
          gapH16,
          ElevatedButton(
            onPressed: () {
              _viewModel.navigateToLogin();
            },
            child: Text(Strings.page2),
          ),
          gapH16,
          ElevatedButton(
            onPressed: () {
              ref.read(themeProvider).toggleThemeMode();
            },
            child: Text(Strings.theme),
          ),
        ],
      ),
    );
  }

  @override
  void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
    // context.pushNamed(
    //   appRoute.name, params: params ?? {},
    //   // {"fid": NavBarScreens.data[1].id},
    // );
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
