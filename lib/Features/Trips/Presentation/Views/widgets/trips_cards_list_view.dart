import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_card.dart';

class TripsCardsListView extends StatelessWidget {
  const TripsCardsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
      sliver: SliverList.separated(
        itemBuilder:
            (context, index) => GestureDetector(
              onTap:
                  () => GoRouter.of(
                    context,
                  ).pushNamed(AppRouter.kTripDetailsName),
              child: TripsCard(),
            ),
        separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s16),
        itemCount: 6,
      ),
    );
  }
}
