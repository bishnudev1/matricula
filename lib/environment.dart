import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:matricula/app.dart';
import 'package:matricula/firebase_options.dart';
import 'package:matricula/models/user_model.dart';
import 'package:matricula/services/shared_preference_service.dart';
import 'package:matricula/utils/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum EnvType {
  DEVELOPMENT,
  STAGING,
  PRODUCTION,
}

class Environment {
  static late Environment value;

  String? baseUrl;
  EnvType environmentType = EnvType.DEVELOPMENT;

  Environment() {
    value = this;
    _init();
  }

  Future<void> _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // await FirebaseMessagingProvider.init();
    await EasyLocalization.ensureInitialized();
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    log("App Name: $appName, Package Name: $packageName, Version: $version, Build Number: $buildNumber");
    await SharedPreferenceService.init();
    try {
      await dotenv.load();
    } catch (e) {
      Logger.write(e.toString());
    }
    var userBox = await Hive.openBox<UserModel>('user');
    log("UserBox is open: ${userBox.isOpen}, UserBox is empty: ${userBox.isEmpty}, UserBox length: ${userBox.length}, UserBox values: ${userBox.values}");

    runApp(
      ProviderScope(
        child: EasyLocalization(
          supportedLocales: const [
            Locale('en'),
            Locale('hi'),
          ],
          path: 'assets/languages',
          fallbackLocale: const Locale('en', 'US'),
          child: const MyApp(),
        ),
      ),
    );
  }
}
