import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';

const List<DropdownMenuItem<String>> kAirports = [
  DropdownMenuItem(
    value: 'ALP',
    child: Text(
      "حلب (ALP)",
      style: TextStyle(
        color: AppColors.titleTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
  DropdownMenuItem(
    value: 'DAM',
    child: Text(
      "دمشق (DAM)",
      style: TextStyle(
        color: AppColors.titleTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
];
