import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
class HIconTheme {
  HIconTheme._();
  static IconThemeData lightIconTheme = IconThemeData(
    color: HColorScheme.lightColorScheme.secondary,
    size: 25,
    weight: 20
  );
  static IconThemeData darkIconTheme = IconThemeData(
    color: HColorScheme.darkColorScheme.secondary,
    size: 25,
    weight: 20
  );
}