import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class BigAirportAndFlightDetails extends StatelessWidget {
  const BigAirportAndFlightDetails({
    super.key,
    required this.airportCode,
    required this.airportName,
    required this.time,
  });

  final String airportCode, airportName, time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          airportCode,
          style: AppStyles.fontsBold22(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
        SizedBox(height: AppSpacing.s2),
        Text(
          airportName,
          style: AppStyles.fontsLight12(
            context,
            12,
          ).copyWith(color: AppColors.bodyTextColor),
        ),
        SizedBox(height: AppSpacing.s2),
        Text(
          time,
          style: AppStyles.fontsRegular14(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
      ],
    );
  }
}
