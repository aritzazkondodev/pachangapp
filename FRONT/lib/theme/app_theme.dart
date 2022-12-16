import 'package:flutter/material.dart';

import 'package:pachangapp/theme/theme.dart';

class AppTheme {
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

    //Borde de los input(Textfield, ...)
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.mainColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.mainColor,
        ),
      ),
    ),

    //Color iconos
    iconTheme: IconThemeData(color: AppColors.white),
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

    //Color iconos
    iconTheme: IconThemeData(color: AppColors.white),
  );
}
