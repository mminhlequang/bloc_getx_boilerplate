import 'package:flutter/material.dart';
import '../utils/utils.dart';

class AppThemes {
  static ThemeData get appTheme {
    bool isDarkMode = AppPrefs.instance.themeModel == "dark";
    return isDarkMode
        ? ThemeData.dark().copyWith()
        : ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            appBarTheme: ThemeData.light().appBarTheme.copyWith(
                  color: Colors.blue,
                ),
          );
  }

  static TextTheme get textTheme => appTheme.textTheme;
}
