import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppFontSizes {
  static const double fontTextExtraBig = 24.0;
  static const double fontTextBig = 20.0;
  static const double fontText = 16.0;
  static const double fontTextSmall = 12.0;
  static const double fontExtraSmall = 8.0;
}

class AppTextStyles {
  static String get fontFamilyRoboto => 'Roboto';

  ///Normal
  static TextStyle get normal => TextStyle(
      fontFamily: fontFamilyRoboto,
      color: AppColors.text,
      fontWeight: FontWeight.normal,
      fontSize: AppFontSizes.fontText);

  static TextStyle get normalBold => normal.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get normalBoldBlack => normal.copyWith(fontWeight: FontWeight.w900);

  ///Small
  static TextStyle get small => TextStyle(
      fontFamily: fontFamilyRoboto,
      color: AppColors.text,
      fontWeight: FontWeight.normal,
      fontSize: AppFontSizes.fontTextSmall);

  static TextStyle get smallBold => normal.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get smallBoldBlack => normal.copyWith(fontWeight: FontWeight.w900);
}
