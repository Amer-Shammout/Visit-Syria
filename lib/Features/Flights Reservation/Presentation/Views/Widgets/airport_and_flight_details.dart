import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class AirportAndFlightDetails extends StatelessWidget {
  const AirportAndFlightDetails({super.key, this.test = "DXB"});
  final String test;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          test,
          style: AppStyles.fontsBold18(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
        SizedBox(height: AppSpacing.s2),
        Text(
          "دبي، الإمارات",
          style: AppStyles.fontsLight10(
            context,
          ).copyWith(color: AppColors.bodyTextColor),
        ),
        SizedBox(height: AppSpacing.s2),
        Text(
          "10:00 م",
          style: AppStyles.fontsRegular12(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
      ],
    );
  }
}
