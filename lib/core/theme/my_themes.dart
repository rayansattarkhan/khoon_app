import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';

class MyThemes {
  static ThemeData myLightTheme() {
    return ThemeData(
      fontFamily: "Arial",
      scaffoldBackgroundColor: MyColors.semiWhite,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: MyColors.brightRed,
        surface: MyColors.semiWhite,
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 24.0,
          fontWeight: .bold,
          color: MyTextColors.darkGrey
        ),
        headlineSmall: TextStyle(
          fontSize: 18.0,
          fontWeight: .bold,
          color: MyTextColors.darkGrey,
        ),
        bodyLarge: TextStyle(
          fontSize: 14,
          fontWeight: .bold,
          color: MyTextColors.darkGrey,
        ),
        bodyMedium: TextStyle(
          fontSize: 13.0,
          fontWeight: .normal,
          color: MyColors.mediumGrey,
        ),
        bodySmall: TextStyle(
          fontSize: 12.0,
          fontWeight: .normal,
          color: MyTextColors.lightGreen,
        )
      ),
    );
  }

  static ThemeData myDarkTheme() {
    return ThemeData(
      fontFamily: "assets/fonts/Arial",
      scaffoldBackgroundColor: MyColors.semiDarkGrey,
      textTheme: TextTheme(
        headlineLarge: TextStyle()
      ),
    );
  }
}