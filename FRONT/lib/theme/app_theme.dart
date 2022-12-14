import 'package:flutter/material.dart';

import 'package:pachangapp/theme/theme.dart';

class AppTheme {
  static final ThemeData ligthTheme = ThemeData.light().copyWith(
    //Primary color
    primaryColor: AppColors.mainColor,
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.black),
      bodyText2: TextStyle(fontSize: 14, color: Colors.green),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    //Primary color
    primaryColor: AppColors.mainColor,
  );
}
