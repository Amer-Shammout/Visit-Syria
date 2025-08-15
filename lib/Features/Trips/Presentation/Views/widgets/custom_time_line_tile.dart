import 'package:flutter/material.dart';
import 'package:timeline_tile_plus/timeline_tile_plus.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/section.dart';

class CustomTimeLineTile extends StatelessWidget {
  const CustomTimeLineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.timeline,
    this.isFormated = false,
  });
  final bool isFirst;
  final bool isLast;
  final Section timeline;
  final bool isFormated;
  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.21,
      indicatorStyle: IndicatorStyle(
        indicatorXY: 0,
        color: AppColors.titleTextColor,
        width: 12,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
      beforeLineStyle: LineStyle(color: AppColors.titleTextColor, thickness: 3),
      afterLineStyle: LineStyle(color: AppColors.titleTextColor, thickness: 3),
      isFirst: isFirst,
      isLast: isLast,
      startChild: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            isFormated
                ? timeline.time!
                : getTimeBased12(timeline.time!.substring(0, 5)),
            style: AppStyles.fontsBold14(context).copyWith(
              color: AppColors.titleTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      endChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            timeline.title ?? "",
            style: AppStyles.fontsBold16(context).copyWith(
              color: AppColors.titleTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: AppSpacing.s4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...(timeline.description ?? []).map(
                  (detail) => Text(
                    "- $detail",
                    style: AppStyles.fontsRegular14(
                      context,
                    ).copyWith(color: AppColors.graySwatch.shade800),
                  ),
                ),
                isLast ? SizedBox.shrink() : SizedBox(height: AppSpacing.s24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String getTimeBased12(String time) {
  String am = "AM";
  String pm = "PM";
  int timeNo = int.parse(time.substring(0, 2));
  if (timeNo < 12) {
    return "$time $am";
  } else if (timeNo >= 20) {
    timeNo = timeNo - 12;
    return "$timeNo${time.substring(2, 5)} $pm";
  } else if (timeNo == 12) {
    return "$time $pm";
  } else {
    timeNo = timeNo - 12;
    return "0$timeNo${time.substring(2, 5)} $pm";
  }
}
