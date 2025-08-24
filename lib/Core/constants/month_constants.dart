import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';

List<DropdownMenuItem<String>> kBuildMonthsDropdownItems(String? selectedYear) {
  final now = DateTime.now();
  final currentYear = now.year;
  final currentMonth = now.month;

  int startMonth = 1;

  if (selectedYear != null && int.tryParse(selectedYear) == currentYear) {
    startMonth = currentMonth; // ابدأ من الشهر الحالي
  }

  final months = List.generate(
    12 - startMonth + 1,
    (index) => startMonth + index,
  );

  return months
      .map(
        (month) => DropdownMenuItem(
          value: month.toString().padLeft(2, '0'), // "01", "02"...
          child: Text(
            month.toString().padLeft(2, '0'), // عرض الرقم بدل الاسم
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
