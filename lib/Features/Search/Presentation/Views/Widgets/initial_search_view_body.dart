import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';

class InitialSearchViewBody extends StatelessWidget {
  const InitialSearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: CustomErrorAndEmptyStateBody(
          illustration: Assets.illustrationsSearchInitial,
          text: "عن ماذا تبحث",
        ),
      ),
    );
  }
}
