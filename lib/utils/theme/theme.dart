import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/theme/appbar_theme.dart';
import 'package:e_commerce/utils/theme/button_theme.dart';
import 'package:e_commerce/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';
class HAppTheme{
  HAppTheme._();
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: HTextTheme.darkTextTheme,
    appBarTheme: HAppBarTheme.darkAppBarTheme,
    colorScheme: HColorScheme.darkColorScheme,
    scaffoldBackgroundColor: HColorScheme.darkColorScheme.background,
    buttonTheme: HButtonTheme.darkButton
  );
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: HTextTheme.lightTextTheme,
    appBarTheme: HAppBarTheme.lightAppBarTheme,
    colorScheme: HColorScheme.lightColorScheme,
    scaffoldBackgroundColor: HColorScheme.lightColorScheme.background,
    buttonTheme: HButtonTheme.lightButton
  );
}