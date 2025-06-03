import 'package:flutter/material.dart';
import 'package:visit_syria/constants.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: AppColors.primarySwatch,

      scaffoldBackgroundColor: AppColors.primarySwatch[50],

      fontFamily: kArabicFont,
    );
  }
}
