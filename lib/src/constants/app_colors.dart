import 'package:flutter/material.dart';
import '../extensions/extensions.dart';
import '../../src/utils/utils.dart';

class AppColors {
  AppColors._();

  ///MAIN COLORS
  static Color get appBackground =>
      AppPrefs.themeModel == 'dark' ? appBackgroundDark : appBackgroundLight;

  static Color get appBackgroundDark => fromHex('#1C222C');

  static Color get appBackgroundLight => fromHex('#1C222C');

  static Color get text => AppPrefs.themeModel == 'dark' ? textDark : textLight;

  static Color get textDark => fromHex('#A5D3FB');

  static Color get textLight => fromHex('#1C222C');

  ///==============

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
