import 'package:flutter/material.dart';
import 'package:matricula/utils/colors.dart';
import 'package:pinput/pinput.dart';

class AppThemes {
  AppThemes._();

  static String font1 = "ProductSans";
  static String font2 = "Roboto";

  //main color
  static const Color _lightPrimaryColor = kDodgerBlue;

  //Background Colors
  static const Color _lightBackgroundColor = kWhiteLilac;
  static const Color _lightBackgroundAppBarColor = _lightPrimaryColor;
  static const Color _lightBackgroundSecondaryColor = kWhite;
  static const Color _lightBackgroundAlertColor = kBlackPearl;
  static const Color _lightBackgroundActionTextColor = kWhite;
  static const Color _lightBackgroundErrorColor = kBrinkPink;
  static const Color _lightBackgroundSuccessColor = kJuneBud;
  static const Color _formBgColor = Color(0xFFF0F8FF);

  //Text Colors
  static const Color _lightTextColor = kBlack;
  static const Color _lightAlertTextColor = kBlack;
  static const Color _lightTextSecondaryColor = kBlack;

  //Border Color
  static const Color _lightBorderColor = kNevada;

  //Icon Color
  static const Color _lightIconColor = kNevada;

  //form input colors
  static const Color _lightInputFillColor = _lightBackgroundSecondaryColor;
  static const Color _lightBorderActiveColor = _lightPrimaryColor;
  static const Color _lightBorderErrorColor = kBrinkPink;

  //constants color range for dark theme
  static const Color _darkPrimaryColor = kDodgerBlue;

  //Background Colors
  static const Color _darkBackgroundColor = kEbonyClay;
  static const Color _darkBackgroundAppBarColor = _darkPrimaryColor;
  static const Color _darkBackgroundSecondaryColor =
      Color.fromRGBO(0, 0, 0, .6);
  static const Color _darkBackgroundAlertColor = kBlackPearl;
  static const Color _darkBackgroundActionTextColor = kWhite;

  static const Color _darkBackgroundErrorColor =
      Color.fromRGBO(255, 97, 136, 1);
  static const Color _darkBackgroundSuccessColor =
      Color.fromRGBO(186, 215, 97, 1);

  //Text Colors
  static const Color _darkTextColor = kWhite;
  static const Color _darkAlertTextColor = kBlack;
  static const Color _darkTextSecondaryColor = kBlack;

  //Border Color
  static const Color _darkBorderColor = kNevada;

  //Icon Color
  static const Color _darkIconColor = kNevada;

  static const Color _darkInputFillColor = _darkBackgroundSecondaryColor;
  static const Color _darkBorderActiveColor = _darkPrimaryColor;
  static const Color _darkBorderErrorColor = kBrinkPink;

  //text theme for light theme
  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 20.0, color: _lightTextColor),
    bodyLarge: TextStyle(fontSize: 16.0, color: _lightTextColor),
    bodyMedium: TextStyle(fontSize: 14.0, color: lightGrey),
    labelLarge: TextStyle(
      fontSize: 15.0,
      color: _lightTextColor,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(fontSize: 16.0, color: _lightTextColor),
    titleMedium: TextStyle(fontSize: 16.0, color: _lightTextColor),
    bodySmall: TextStyle(fontSize: 12.0, color: _lightBackgroundAppBarColor),
  );

  //pinput theme
  static final pinputTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: borderColor),
    ),
  );

  //the light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: font1,
    scaffoldBackgroundColor: _lightBackgroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _lightPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: _lightBackgroundAppBarColor,
      iconTheme: const IconThemeData(color: _lightTextColor),
      toolbarTextStyle: _lightTextTheme.bodyMedium,
      titleTextStyle: _lightTextTheme.titleLarge,
    ),
    colorScheme: const ColorScheme.light(
      primary: _lightPrimaryColor,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: _lightBackgroundAlertColor,
      actionTextColor: _lightBackgroundActionTextColor,
    ),
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    popupMenuTheme:
        const PopupMenuThemeData(color: _lightBackgroundAppBarColor),
    textTheme: _lightTextTheme,
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      buttonColor: _lightPrimaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    unselectedWidgetColor: _lightPrimaryColor,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderActiveColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      fillColor: Color(0xFFE6EAF1),
    ),
  );

  //text theme for dark theme
  static const TextTheme _darkTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 20.0, color: _darkTextColor),
    bodyLarge: TextStyle(fontSize: 16.0, color: _darkTextColor),
    bodyMedium: TextStyle(fontSize: 14.0, color: lightGrey),
    labelLarge: TextStyle(
      fontSize: 15.0,
      color: _darkTextColor,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(fontSize: 16.0, color: _darkTextColor),
    titleMedium: TextStyle(fontSize: 16.0, color: _darkTextColor),
    bodySmall: TextStyle(fontSize: 12.0, color: _darkBackgroundAppBarColor),
  );

  //the dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: font1,
    scaffoldBackgroundColor: _darkBackgroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _darkPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: _darkBackgroundAppBarColor,
      iconTheme: const IconThemeData(color: _darkTextColor),
      toolbarTextStyle: _darkTextTheme.bodyMedium,
      titleTextStyle: _darkTextTheme.titleLarge,
    ),
    snackBarTheme: const SnackBarThemeData(
      contentTextStyle: TextStyle(color: kWhite),
      backgroundColor: _darkBackgroundAlertColor,
      actionTextColor: _darkBackgroundActionTextColor,
    ),
    iconTheme: const IconThemeData(
      color: _darkIconColor,
    ),
    popupMenuTheme: const PopupMenuThemeData(color: _darkBackgroundAppBarColor),
    textTheme: _darkTextTheme,
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      buttonColor: _darkPrimaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    unselectedWidgetColor: _darkPrimaryColor,
    inputDecorationTheme: const InputDecorationTheme(
      prefixStyle: TextStyle(color: _darkIconColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderActiveColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      fillColor: _darkInputFillColor,
    ),
    colorScheme: const ColorScheme.dark(
      primary: _darkPrimaryColor,
    ).copyWith(secondary: _darkPrimaryColor),
  );
}
