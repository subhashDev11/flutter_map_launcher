import 'package:test_today/core/app_extensions.dart';
import 'package:test_today/core/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  static final lightThemeData = ThemeData.light();

  static final lightTheme = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: ColorConstants.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      background: Colors.white,
      seedColor: ColorConstants.primaryColor,
    ),
  ).copyWith(
    brightness: Brightness.light,
    appBarTheme: lightThemeData.appBarTheme.copyWith(
      backgroundColor: Colors.white,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      iconTheme: lightThemeData.appBarTheme.iconTheme?.copyWith(
        color: Colors.black87,
      ),
    ),
    iconTheme: lightThemeData.iconTheme.copyWith(
      color: Colors.black87,
    ),
    cardColor: Colors.white,
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.black),
      fillColor: MaterialStateProperty.all(ColorConstants.primaryColor),
      splashRadius: 20,
      materialTapTargetSize: MaterialTapTargetSize.padded,
    ),
    colorScheme: lightThemeData.colorScheme
        .copyWith(
          primary: ColorConstants.primaryColor,
        )
        .copyWith(background: Colors.white),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  );

  static final darkThemeData = ThemeData.dark();

  static final darkTheme = ThemeData.dark(
    useMaterial3: false,
  ).copyWith(
    textTheme: darkThemeData.textTheme
        .apply(
          fontFamily: 'Roboto',
        ),
    primaryTextTheme: darkThemeData.textTheme.apply(
      fontFamily: 'Roboto',
    ),
    primaryColor: ColorConstants.primaryColor,
    scaffoldBackgroundColor: darkThemeData.scaffoldBackgroundColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorConstants.primaryColor,
    ),
    brightness: Brightness.dark,
    appBarTheme: darkThemeData.appBarTheme.copyWith(
      iconTheme: darkThemeData.appBarTheme.iconTheme,
    ),
    iconTheme: darkThemeData.iconTheme.copyWith(
      color: Colors.white,
    ),
    cardColor: darkThemeData.cardColor,
    dialogTheme: darkThemeData.dialogTheme,
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.redAccent),
      fillColor: MaterialStateProperty.all(ColorConstants.primaryColor),
      splashRadius: 20,
      materialTapTargetSize: MaterialTapTargetSize.padded,
    ),
    bottomAppBarTheme: darkThemeData.bottomAppBarTheme,
    inputDecorationTheme: darkThemeData.inputDecorationTheme.copyWith(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          style: BorderStyle.solid,
        ),
      ),
    ),
  );

  static ThemeData getDatePickerDialogTheme(BuildContext context) {
    final theme = Theme.of(context);
    return context.isDarkTheme()
        ? ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: theme.primaryColor,
              onPrimary: Colors.white,
              surface: Colors.pink,
              onSurface: Colors.yellow.shade400,
            ),
            dialogBackgroundColor: Colors.blue[900],
          )
        : Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor, // header background color
              onPrimary: theme.scaffoldBackgroundColor, // header text color
              // body text color
            ),
          );
  }
}
