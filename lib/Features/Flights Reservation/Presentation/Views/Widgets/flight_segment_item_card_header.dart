import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/segment.dart';

class FlightSegementsItemCardHeader extends StatelessWidget {
  const FlightSegementsItemCardHeader({super.key, required this.segment});

  final Segment segment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.iconsAirplaneUp, width: 32, height: 32),
        SizedBox(width: AppSpacing.s8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              segment.airline!,
              style: AppStyles.fontsRegular14(
                context,
              ).copyWith(color: AppColors.titleTextColor),
            ),
          ],
        ),
      ],
    );
  }
}
