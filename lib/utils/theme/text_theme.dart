import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HTextTheme {
  HTextTheme._(); // Private constructor to prevent instantiation

  static const String fontFamily = 'Roboto';

  static TextStyle _baseTextStyle({
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    double fontSize = 14.0,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
    );
  }

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: _baseTextStyle(fontWeight: FontWeight.bold, fontSize: 32.0, color: HColorScheme.darkColorScheme.primary),
    headlineMedium: _baseTextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: HColorScheme.darkColorScheme.onSurface),
    headlineSmall: _baseTextStyle(fontWeight: FontWeight.w600, fontSize: 20.0, color: HColorScheme.darkColorScheme.onSurface),
    bodyLarge: _baseTextStyle(fontWeight: FontWeight.w400, fontSize: 24.0, color: HColorScheme.darkColorScheme.onSurface),
    bodyMedium: _baseTextStyle(fontWeight: FontWeight.w400, fontSize: 16.0, color: HColorScheme.darkColorScheme.onSurface),
    bodySmall: _baseTextStyle(fontWeight: FontWeight.w400, fontSize: 14.0, color: HColorScheme.darkColorScheme.onSurface.withOpacity(0.5)),
    titleMedium: _baseTextStyle(fontWeight: FontWeight.w500, fontSize: 24.0, color: HColorScheme.darkColorScheme.primary),
    titleSmall: _baseTextStyle(fontWeight: FontWeight.w400, fontSize: 20.0, color: HColorScheme.darkColorScheme.primary),
    titleLarge: _baseTextStyle(fontWeight: FontWeight.w500, fontSize: 24.0, color: Colors.white),
  );

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: _baseTextStyle(fontWeight: FontWeight.bold, fontSize: 32.0, color: HColorScheme.lightColorScheme.primary),
    headlineMedium: _baseTextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: HColorScheme.lightColorScheme.onSurface),
    headlineSmall: _baseTextStyle(fontWeight: FontWeight.w600, fontSize: 20.0, color: HColorScheme.lightColorScheme.onSurface),
    bodyLarge: _baseTextStyle(fontWeight: FontWeight.w400, fontSize: 24.0, color: HColorScheme.lightColorScheme.onSurface),
    bodyMedium: _baseTextStyle(fontWeight: FontWeight.w400, fontSize: 16.0, color: HColorScheme.lightColorScheme.onSurface),
    bodySmall: _baseTextStyle(fontWeight: FontWeight.w400, fontSize: 14.0, color: HColorScheme.lightColorScheme.onSurface.withOpacity(0.5)),
    titleMedium: _baseTextStyle(fontWeight: FontWeight.w500, fontSize: 24.0, color: HColorScheme.lightColorScheme.primary),
    titleSmall: _baseTextStyle(fontWeight: FontWeight.w400, fontSize: 20.0, color: HColorScheme.lightColorScheme.primary),
    titleLarge: _baseTextStyle(fontWeight: FontWeight.w500, fontSize: 24.0, color: Colors.white),
  );
}
