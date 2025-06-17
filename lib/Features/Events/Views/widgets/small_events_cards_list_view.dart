import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/events_card.dart';

class SmallEventsCardListView extends StatelessWidget {
  const SmallEventsCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 173,
      child: ListView.separated(
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsetsDirectional.only(
                end: index == 5 ? 16 : 0,
                start: index == 0 ? 16 : 0,
              ),
              child: AspectRatio(
                aspectRatio: 250 / 173,
                child: EventCard(isSmall: true),
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(width: AppSpacing.s12),
        itemCount: 6,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
