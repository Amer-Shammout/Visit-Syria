import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';

const List<DropdownMenuItem<String>> kGenderDropdownItems = [
  DropdownMenuItem(
    value: 'male',
    child: Text(
      "ذكر",
      style: TextStyle(
        color: AppColors.titleTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
  DropdownMenuItem(
    value: 'female',
    child: Text(
      "أنثى",
      style: TextStyle(
        color: AppColors.titleTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
];
