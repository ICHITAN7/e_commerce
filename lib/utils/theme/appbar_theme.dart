import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/theme/icon_theme.dart';
import 'package:flutter/material.dart';
class HAppBarTheme {
  HAppBarTheme._();
  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: HColorScheme.darkColorScheme.background,
    elevation: 0,
    centerTitle: true,
    iconTheme: HIconTheme.darkIconTheme,
    surfaceTintColor: HColorScheme.darkColorScheme.onSurface
  );
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: HColorScheme.lightColorScheme.background,
    elevation: 0,
    centerTitle: true,
    iconTheme: HIconTheme.lightIconTheme,
    surfaceTintColor: HColorScheme.lightColorScheme.onSurface
  );
}