import 'package:flutter/widgets.dart';
import 'package:matricula/app/app_routes.dart';
import 'package:go_router/go_router.dart';

void navigateToScreen(AppRoute appRoute, BuildContext context,
    {Map<String, String>? params}) {
  context.pushNamed(
    appRoute.name,
    queryParameters: params ?? {},
  );
}
