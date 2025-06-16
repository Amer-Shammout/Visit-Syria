import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/events_card.dart';

class AllEventsListView extends StatelessWidget {
  const AllEventsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16),
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s16),
      itemBuilder: (context, index) => EventCard(),
      clipBehavior: Clip.none,
      itemCount: 10,
    );
  }
}
