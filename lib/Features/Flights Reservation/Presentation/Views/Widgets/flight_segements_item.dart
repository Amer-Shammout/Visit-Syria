import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/constants/flights_reservation_constants.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_card_background.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_and_blog_tag.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/segment.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flights_offer_card_header.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/functions/time_and_date_functions.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_time_line_tile.dart';

class FlightSegementsItem extends StatelessWidget {
  const FlightSegementsItem({super.key, required this.segments});

  final List<Segment> segments;

  @override
  Widget build(BuildContext context) {
    final segmentTimes = extractTimesFromSegments(segments);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PostandBlogTag(
          tag: segmentTimes[0][kDepartureDate]!,
          hasIcon: true,
          icon: Assets.iconsDate,
        ),
        SizedBox(height: AppSpacing.s24),
      ],
    );
  }
}

class FlightSegementsItemCard extends StatelessWidget {
  const FlightSegementsItemCard({super.key, required this.segment});

  final Segment segment;

  @override
  Widget build(BuildContext context) {
    return CustomCardBackground(
      padding: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlightSegementsItemCardHeader(segment: segment),
          SizedBox(height: AppSpacing.s16),
          Column(children: [
            CustomTimeLineTile(isFirst: true,isLast: false,)
          ],)
        ],
      ),
    );
  }
}

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
