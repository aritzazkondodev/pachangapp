import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class InputDecorations {
  
  static BoxDecoration authBoxInputDecoration = BoxDecoration(
    color: AppColors.softBlack,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: const [
      BoxShadow(
        color: Colors.white10,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  static InputDecoration authInputDecoration(String hintText, IconData prefixIcon) {
    return InputDecoration(
      fillColor: Colors.black,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide( color: Colors.white ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide( color: AppColors.mainColor ),
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),

      border: const OutlineInputBorder(
        borderSide: BorderSide( color: Colors.white ),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),

      hintText: hintText,
      prefixIcon: Icon(prefixIcon),
    );
  }
}