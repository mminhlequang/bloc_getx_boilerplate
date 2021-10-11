import 'package:flutter/material.dart';
import '../extensions/extensions.dart';

class AppStyles {
  AppStyles._();

  static Gradient get gradient => LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [HexColor.fromHex('#1C222C'), HexColor.fromHex('#343F5C')]);
}
