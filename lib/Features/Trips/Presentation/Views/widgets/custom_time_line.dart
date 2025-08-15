import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/timeline.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_time_line_tile.dart';

class CustomTimeLine extends StatefulWidget {
  const CustomTimeLine({super.key, required this.timelines});
  final List<Timeline>? timelines;

  @override
  State<CustomTimeLine> createState() => _CustomTimeLineState();
}

class _CustomTimeLineState extends State<CustomTimeLine> {
  int selectedDayIndex = 0;

  @override
  Widget build(BuildContext context) {
    final timelines = widget.timelines ?? [];

    return CustomSection(
      title: "الجدول الزمني",
      hasSeeAll: false,
      section: Column(
        children: [
          TagsListView(
            data: getDays(timelines) ?? [],
            onTagSelected: (value, index) {
              setState(() {
                selectedDayIndex = index;
              });
            },
          ),
          SizedBox(height: AppSpacing.s8),
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount:
                timelines.isNotEmpty
                    ? (timelines[selectedDayIndex].sections?.length ?? 0)
                    : 0,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final currentSections =
                  timelines[selectedDayIndex].sections ?? [];
              bool isFirst = index == 0;
              bool isLast = index == currentSections.length - 1;

              return CustomTimeLineTile(
                isFirst: isFirst,
                isLast: isLast,
                timeline: currentSections[index],
              );
            },
          ),
        ],
      ),
    );
  }
}

List<String>? getDays(final List<Timeline>? timelines) {
  if (timelines == null) return null;
  return timelines.map((t) => "اليوم${t.dayNumber}").toList();
}
