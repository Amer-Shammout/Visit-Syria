import 'package:flutter/material.dart';
import 'package:timeline_tile_plus/timeline_tile_plus.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class CustomTimeLineTile extends StatelessWidget {
  const CustomTimeLineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
  });
  final bool isFirst;
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    List<String> details = [
      "التجمع فيكراج العباسيين",
      "حزم الامتعة",
      "اخذ الموافقات",
      "الركوب بالباصات",
    ];
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
            "10:00 AM",
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
            "الذهاب الى كراج العباسيين",
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
                ...details.map(
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
