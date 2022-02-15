import 'package:flutter/material.dart';
import 'constants.dart';

class AppStyles {
  AppStyles._();

  static Gradient get gradient => LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [AppColors.fromHex('#1C222C'), AppColors.fromHex('#343F5C')]);
}
