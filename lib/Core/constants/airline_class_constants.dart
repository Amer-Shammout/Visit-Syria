import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';

const List<DropdownMenuItem<String>> kAirlineClasses = [
  DropdownMenuItem(
    value: 'ECONOMY',
    child: Text(
      "اقتصادية",
      style: TextStyle(
        color: AppColors.titleTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
  DropdownMenuItem(
    value: 'PREMIUM_ECONOMY',
    child: Text(
      "اقتصادية مميزة",
      style: TextStyle(
        color: AppColors.titleTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
  DropdownMenuItem(
    value: 'BUSINESS',
    child: Text(
      "رجال أعمال",
      style: TextStyle(
        color: AppColors.titleTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
  DropdownMenuItem(
    value: 'FIRST',
    child: Text(
      "درجة أولى",
      style: TextStyle(
        color: AppColors.titleTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
];
