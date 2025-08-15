import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/constants/flights_reservation_constants.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_and_blog_tag.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/segment.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flight_segment_item_card.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/functions/time_and_date_functions.dart';

class FlightSegementsItem extends StatelessWidget {
  const FlightSegementsItem({super.key, required this.segments});

  final List<Segment> segments;

  @override
  Widget build(BuildContext context) {
    final segmentTimes = extractTimesFromSegments(segments);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: PostandBlogTag(
            tag: segmentTimes[0][kDepartureDate]!,
            hasIcon: true,
            icon: Assets.iconsDate,
          ),
        ),
        SizedBox(height: AppSpacing.s24),
        ListView.separated(
          itemBuilder:
              (context, index) =>
                  FlightSegementsItemCard(segment: segments[index]),
          separatorBuilder:
              (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    child: VerticalDivider(
                      thickness: 2,
                      color: AppColors.titleTextColor,
                      width: 45,
                    ),
                  ),
                  SizedBox(height: AppSpacing.s4),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 16),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.iconsDuration,
                          width: 12,
                          height: 12,
                          colorFilter: ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcATop,
                          ),
                        ),
                        SizedBox(width: AppSpacing.s2),
                        Text(
                          "${segments[index].layoverHours} ساعة انتظار في المطار",
                          style: AppStyles.fontsRegular10(
                            context,
                          ).copyWith(color: AppColors.bodyTextColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.s4),

                  SizedBox(
                    height: 40,
                    child: VerticalDivider(
                      thickness: 2,
                      color: AppColors.titleTextColor,
                      width: 45,
                    ),
                  ),
                ],
              ),
          itemCount: segments.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          clipBehavior: Clip.none,
        ),
      ],
    );
  }
}
