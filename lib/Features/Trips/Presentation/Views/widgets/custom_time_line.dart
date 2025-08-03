import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_time_line_tile.dart';

class CustomTimeLine extends StatelessWidget {
  const CustomTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: "الجدول الزمني",
      hasSeeAll: false,
      section: Column(
        children: [
          TagsListView(data: ["اليوم1", "اليوم2", "اليوم3"]),
          SizedBox(height: AppSpacing.s8),
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              bool isFirst = false;
              bool isLast = false;
              index == 0
                  ? isFirst = true
                  : index == 9
                  ? isLast = true
                  : isFirst = isLast = false;
              return CustomTimeLineTile(isFirst: isFirst, isLast: isLast);
            },
          ),
        ],
      ),
    );
  }
}
