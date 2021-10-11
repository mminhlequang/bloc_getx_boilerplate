import 'package:bloc_getx_boilerplate/src/utils/utils.dart';
import 'package:flutter/material.dart';
import '../extensions/extensions.dart';

class AppColors {
  AppColors._();

  ///MAIN COLORS
  static Color get appBackground =>
      AppPrefs.themeModel == 'dark' ? appBackgroundDark : appBackgroundLight;

  static Color get appBackgroundDark => HexColor.fromHex('#1C222C');

  static Color get appBackgroundLight => HexColor.fromHex('#1C222C');

  static Color get text => AppPrefs.themeModel == 'dark' ? textDark : textLight;

  static Color get textDark => HexColor.fromHex('#A5D3FB');

  static Color get textLight => HexColor.fromHex('#1C222C');

  ///==============
}
