import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/views/splash/splash_view_model.dart';

class Splash extends ConsumerStatefulWidget {
  const Splash({super.key});

  @override
  ConsumerState<Splash> createState() => _SplashState();
}

class _SplashState extends ConsumerState<Splash> with BaseScreenView {
  late final SplashViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(splashViewModelProvider);
    _viewModel.view = this;
    _viewModel.navigateToSecondScreen(context, ref);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("assets/images/mat_logo.png"),
            ),
          ),
          const CircularProgressIndicator(
            color: primaryColor,
          ),
        ],
      ),
    );
  }

  // @override
  // void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
  //   // TODO: implement navigateToScreen
  //   // context.pushNamed(
  //   //   appRoute.name, params: params ?? {},
  //   //   // {"fid": NavBarScreens.data[1].id},
  //   // );
  // }

  // @override
  // void showSnackbar(String message, {Color? color}) {
  //   // TODO: implement showSnackbar
  // }
}
