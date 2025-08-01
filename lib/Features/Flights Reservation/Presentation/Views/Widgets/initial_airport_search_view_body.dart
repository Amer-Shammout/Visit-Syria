import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';

class InitialAirportSearchViewBody extends StatelessWidget {
  const InitialAirportSearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: CustomErrorAndEmptyStateBody(
        illustration: Assets.illustrationsFlightsSearch,
        text: "عن ماذا تبحث؟",
      ),
    );
  }
}
