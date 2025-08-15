import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_and_blog_tag.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';

class FlightsOfferCardHeader extends StatelessWidget {
  const FlightsOfferCardHeader({super.key, required this.flightOffer});

  final FlightModel flightOffer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(Assets.iconsAirplaneUp, width: 32, height: 32),
            SizedBox(width: AppSpacing.s8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  flightOffer.departureModel!.airline!,
                  style: AppStyles.fontsRegular14(
                    context,
                  ).copyWith(color: AppColors.titleTextColor),
                ),
                SizedBox(height: AppSpacing.s2),
                Text(
                  flightOffer.isRoundTrip!
                      ? "${flightOffer.departureModel!.departureDate} / ${flightOffer.flightModelReturn!.departureDate}"
                      : "${flightOffer.departureModel!.departureDate}",
                  style: AppStyles.fontsLight10(
                    context,
                  ).copyWith(color: AppColors.bodyTextColor),
                ),
              ],
            ),
          ],
        ),
        PostandBlogTag(tag: "اقتصادي"),
      ],
    );
  }
}
