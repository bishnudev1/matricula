import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/providers/router_provider.dart';
import 'package:matricula/providers/theme_provider.dart';
import 'package:matricula/providers/auth_providers.dart';
import 'package:matricula/utils/themes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(routerProvider);
    final themeManager = ref.watch(themeProvider);
    // final auth = ref.watch(authProviders);

    // log("Signed in status: ${auth.isSignedIn}");

    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      routeInformationProvider: goRouter.routeInformationProvider,
      theme: AppThemes.lightTheme,
      // darkTheme: AppThemes.darkTheme,
      themeMode: themeManager.currentTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
