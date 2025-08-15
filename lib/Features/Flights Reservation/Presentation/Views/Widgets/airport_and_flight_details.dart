import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class AirportAndFlightDetails extends StatelessWidget {
  const AirportAndFlightDetails({super.key, required this.airportCode, required this.airportName, required this.time});

  final String airportCode, airportName, time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          airportCode,
          style: AppStyles.fontsBold18(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
        SizedBox(height: AppSpacing.s2),
        Text(
          airportName,
          style: AppStyles.fontsLight10(
            context,
          ).copyWith(color: AppColors.bodyTextColor),
        ),
        SizedBox(height: AppSpacing.s2),
        Text(
          time,
          style: AppStyles.fontsRegular12(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
      ],
    );
  }
}
