import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/events_card.dart';

class AllEventsListView extends StatelessWidget {
  const AllEventsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s16),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => GoRouter.of(context).pushNamed(AppRouter.kEventDetailsName),
        child: EventCard()),
      clipBehavior: Clip.none,
      itemCount: 10,
    );
  }
}
