import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';

class FlightsOffersCardFooter extends StatelessWidget {
  const FlightsOffersCardFooter({super.key, required this.flightOffer});

  final FlightModel flightOffer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constrains) {
            return Dash(
              direction: Axis.horizontal,
              length: constrains.maxWidth,
              dashLength: 8,
              dashGap: 4,
              dashColor: AppColors.graySwatch[300]!,
              dashThickness: 1,
            );
          },
        ),
        SizedBox(height: AppSpacing.s16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.iconsTicket,
                  width: 16,
                  height: 16,
                  colorFilter: ColorFilter.mode(
                    AppColors.bodyTextColor,
                    BlendMode.srcATop,
                  ),
                ),
                SizedBox(width: AppSpacing.s4),
                Text(
                  "${flightOffer.seatsRemaining} تذاكر متبقية",
                  style: AppStyles.fontsLight10(
                    context,
                  ).copyWith(color: AppColors.bodyTextColor),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${flightOffer.priceTotal}\$",
                  style: AppStyles.fontsBold18(
                    context,
                  ).copyWith(color: AppColors.primary),
                ),
                SizedBox(height: AppSpacing.s2),
                Text(
                  "${flightOffer.pricePerPassenger}\$ للشخص الواحد",
                  style: AppStyles.fontsLight12(
                    context,
                    12,
                  ).copyWith(color: AppColors.bodyTextColor),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
