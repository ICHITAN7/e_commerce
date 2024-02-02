import 'package:flutter/material.dart';
class HButtonTheme{
  HButtonTheme._();
  static ButtonThemeData darkButton = ButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    padding:const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
  );
  static ButtonThemeData lightButton = ButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    padding:const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
  );
}