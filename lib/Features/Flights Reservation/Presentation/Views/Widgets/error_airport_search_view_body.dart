import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';

class ErrorAirportSearchViewBody extends StatelessWidget {
  const ErrorAirportSearchViewBody({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: CustomErrorAndEmptyStateBody(
        illustration: Assets.illustrationsSearchNoResults,
        text: message,
      ),
    );
  }
}
