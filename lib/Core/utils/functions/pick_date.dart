import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../styles/app_colors.dart';

Future<String?> pickDate({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
  Locale locale = const Locale('ar'),
  String dateFormat = 'yyyy / MM / dd',
  Color primaryColor = AppColors.primary,
}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime(1900),
    lastDate: lastDate ?? DateTime.now(),
    locale: locale,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: primaryColor,
            onPrimary: AppColors.whiteColor,
            onSurface: AppColors.titleTextColor,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: primaryColor),
          ),
        ),
        child: child!,
      );
    },
  );

  if (picked != null) {
    return DateFormat(dateFormat).format(picked);
  }
  return null;
}
