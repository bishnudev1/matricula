import 'package:flutter/material.dart';
import 'package:matricula/providers/theme_provider.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/utils/translations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

import 'home_view_model.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

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
              _viewModel.showSnackbar("wohooo!!!!", context);
            },
            child: Text(Strings.showSnackbar),
          ),
          gapH16,
          ElevatedButton(
            onPressed: () {
              _viewModel.navigateToLogin(context);
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

  // @override
  // void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
  //   // context.pushNamed(
  //   //   appRoute.name, params: params ?? {},
  //   //   // {"fid": NavBarScreens.data[1].id},
  //   // );
  // }

  // @override
  // void showSnackbar(String message, {Color? color}) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       backgroundColor: color,
  //     ),
  //   );
  // }
}
