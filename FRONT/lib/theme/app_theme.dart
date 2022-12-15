import 'package:flutter/material.dart';

import 'package:pachangapp/theme/theme.dart';

class AppTheme {
  // static final ThemeData ligthTheme = ThemeData.light().copyWith(
  //   //Primary color
  //   primaryColor: AppColors.mainColor,
  //   textTheme: TextTheme(
  //     headline1: TextStyle(
  //       fontSize: 35,
  //       // fontFamily: 'Rubik',
  //       fontWeight: FontWeight.bold,
  //       color: AppColors.black,
  //     ),
  //     bodyText2: TextStyle(fontSize: 14, color: Colors.green),
  //   ),
  // );

  static final ThemeData ligthTheme = ThemeData(
    fontFamily: 'Rubik',
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.orange,
      secondary: Colors.orangeAccent,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: AppColors.darkBlack,
      ),
      bodyText2: const TextStyle(
        fontSize: 14,
        color: Colors.blue,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Rubik',
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.orange,
      secondary: Colors.orangeAccent,
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        color: AppColors.white,
      ),
    ),
  );
}
