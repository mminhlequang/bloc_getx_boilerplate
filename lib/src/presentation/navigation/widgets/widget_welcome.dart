import 'package:bloc_getx_boilerplate/src/constants/app_text_theme.dart';
import 'package:flutter/material.dart';

class WidgetWelcome extends StatelessWidget {
  const WidgetWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to boilerplate!',
        style: STYLE_MEDIUM_BOLD,
      ),
    );
  }
}
