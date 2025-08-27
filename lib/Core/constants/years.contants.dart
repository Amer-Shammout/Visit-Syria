import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';

List<DropdownMenuItem<String>> buildYearDropdownItems() {
  final currentYear = DateTime.now().year;
  final years = List.generate(6, (index) => currentYear + index); // الحالي + 5

  return years
      .map(
        (year) => DropdownMenuItem(
          value: year.toString(), // القيمة الكاملة "2025"
          child: Text(
            year.toString().substring(2), // يظهر للمستخدم "25"
            style: const TextStyle(
              color: AppColors.titleTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      )
      .toList();
}
