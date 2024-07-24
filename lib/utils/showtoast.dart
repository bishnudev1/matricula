import 'package:flutter/material.dart';

void showToast(String message, BuildContext context, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color ?? Colors.black,
    ),
  );
}
