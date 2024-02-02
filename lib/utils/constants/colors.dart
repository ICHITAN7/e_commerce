import 'package:flutter/material.dart';

/// This class defines a color scheme for the application.
class HColorScheme {
  HColorScheme._();

  // Primary Colors
  static const Color _kPrimaryColor = Color(0xFFFF7643);
  static const Color _kPrimaryLightColor = Color(0xFFFFECDF);
  static const Color _kSecondaryColor = Color(0xFF979797);

  // Dark Theme Colors
  static const Color _kDarkPrimaryColor = Color(0xFF2E2E2E);
  static const Color _kDarkPrimaryDarkColor = Color(0xFF565656);
  static const Color _kDarkSecondaryColor = Color(0xFF979797);

  // Gradients
  static const LinearGradient _kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [_kPrimaryColor, _kPrimaryLightColor],
  );

  static const LinearGradient _kDarkPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [_kDarkPrimaryDarkColor, _kDarkPrimaryColor],
  );

  // Color Schemes
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _kPrimaryColor,
    onPrimary: Colors.white,
    secondary: _kSecondaryColor,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    background: _kPrimaryLightColor,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: _kPrimaryColor,
    onPrimary: Colors.white,
    secondary: _kDarkSecondaryColor,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    background: _kDarkPrimaryDarkColor,
    onBackground: Colors.white,
    surface: _kDarkPrimaryColor,
    onSurface: Colors.white,
  );

  // Public accessors for gradients
  static LinearGradient get primaryGradient => _kPrimaryGradientColor;
  static LinearGradient get darkPrimaryGradient => _kDarkPrimaryGradientColor;
}
