import 'package:flutter/material.dart';

class Styles {
  static const _defaultTextStyle = TextStyle(fontWeight: FontWeight.w500);

  ThemeData themeData(int index, BuildContext context) {
    switch (index) {
      case 0:
        return setWhiteTheme(context);
      case 1:
        return setBlackTheme(context);
      case 2:
        return setOtherTheme(
            context: context, mColor: Colors.red, color: Colors.red);
      case 3:
        return setOtherTheme(
            context: context, mColor: Colors.green, color: Colors.greenAccent);
      case 4:
        return setOtherTheme(
            context: context, mColor: Colors.blue, color: Colors.blueAccent);
      case 5:
        return setOtherTheme(
            context: context,
            mColor: Colors.yellow,
            color: Colors.yellowAccent);
      case 6:
        return setOtherTheme(
            context: context, mColor: Colors.amber, color: Colors.amber);
      case 7:
        return setOtherTheme(
            context: context,
            mColor: Colors.deepPurple,
            color: Colors.deepPurpleAccent);
      default:
        return setWhiteTheme(context);
    }
  }

  ThemeData setWhiteTheme(BuildContext context) {
    return ThemeData(
      // primarySwatch: Colors.white,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      indicatorColor: Colors.black,
      hintColor: Colors.grey.shade600,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: const Color(0xFF202020),
        onPrimary: const Color(0xFF505050),
        secondary: const Color(0xFFBBBBBB),
        onSecondary: const Color(0xFFEAEAEA),
        error: Colors.red.shade500,
        onError: Colors.red.shade500,
        background: const Color(0xFFF1F2F3),
        onBackground: const Color(0xFFFFFFFF),
        surface: const Color(0xFF54B435),
        onSurface: const Color(0xFF54B435),
      ),
      highlightColor: Colors.grey.shade200,
      focusColor: Colors.black,
      disabledColor: Colors.grey.shade300,
      cardColor: Colors.grey.shade100,
      brightness: Brightness.light,
      buttonTheme: Theme.of(context)
          .buttonTheme
          .copyWith(colorScheme: const ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
    );
  }

  ThemeData setBlackTheme(BuildContext context) {
    return ThemeData(
      // primarySwatch: Colors.black,
      primaryColor: Colors.black,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: const Color(0xFF202020),
        onPrimary: const Color(0xFF505050),
        secondary: const Color(0xFFBBBBBB),
        onSecondary: const Color(0xFFEAEAEA),
        error: Colors.red.shade900,
        onError: Colors.red.shade900,
        background: Colors.black,
        onBackground: const Color(0xFFFFFFFF),
        surface: const Color(0xFF54B435),
        onSurface: const Color(0xFF54B435),
      ),
      indicatorColor: Colors.white,
      hintColor: Colors.grey.shade500,
      highlightColor: Colors.grey.shade700,
      focusColor: Colors.white,
      disabledColor: Colors.grey.shade800,
      cardColor: const Color.fromARGB(255, 41, 40, 40),
      brightness: Brightness.dark,
      buttonTheme: Theme.of(context)
          .buttonTheme
          .copyWith(colorScheme: const ColorScheme.dark()),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 28, 28, 28),
        elevation: 0,
      ),
    );
  }

  ThemeData setOtherTheme(
      {required BuildContext context,
      required MaterialColor mColor,
      required Color color}) {
    return ThemeData(
      primarySwatch: mColor,
      primaryColor: mColor,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: const Color(0xFF202020),
        onPrimary: const Color(0xFF505050),
        secondary: const Color(0xFFBBBBBB),
        onSecondary: const Color(0xFFEAEAEA),
        error: mColor.shade500,
        onError: mColor.shade500,
        background: Colors.white,
        onBackground: const Color(0xFFFFFFFF),
        surface: const Color(0xFF54B435),
        onSurface: const Color(0xFF54B435),
      ),
      indicatorColor: mColor,
      hintColor: mColor.shade200,
      highlightColor: Colors.grey.shade200,
      focusColor: color,
      disabledColor: Colors.grey.shade300,
      cardColor: Colors.grey.shade100,
      brightness: Brightness.light,
      buttonTheme: Theme.of(context)
          .buttonTheme
          .copyWith(colorScheme: const ColorScheme.light()),
      appBarTheme: AppBarTheme(
        backgroundColor: mColor,
        elevation: 0,
      ),
    );
  }

  static TextTheme textTheme(BuildContext context) {
    return TextTheme(
      displayLarge: _defaultTextStyle.copyWith(
          fontSize: 100,
          color: Theme.of(context).indicatorColor,
          fontWeight: FontWeight.w200),
      displayMedium: _defaultTextStyle.copyWith(
          fontSize: 25, color: Theme.of(context).indicatorColor),
      displaySmall: _defaultTextStyle.copyWith(
          fontSize: 16, color: Theme.of(context).indicatorColor),
      headlineMedium: _defaultTextStyle.copyWith(
          fontSize: 18, color: Theme.of(context).indicatorColor),
      headlineSmall: _defaultTextStyle.copyWith(
          fontSize: 14, color: Theme.of(context).indicatorColor),
      bodyLarge: _defaultTextStyle.copyWith(
          fontSize: 13, color: Theme.of(context).indicatorColor),
      bodyMedium: _defaultTextStyle.copyWith(
          fontSize: 20, color: Theme.of(context).indicatorColor),
      titleMedium: _defaultTextStyle.copyWith(
          fontSize: 12, color: Theme.of(context).hintColor),
      titleSmall: _defaultTextStyle.copyWith(
          fontSize: 10, color: Theme.of(context).hintColor),
    );
  }
}
