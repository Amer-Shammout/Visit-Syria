import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';

class ErrorSearchViewBody extends StatelessWidget {
  const ErrorSearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: CustomErrorAndEmptyStateBody(
          illustration: Assets.illustrationsSearchNoResults,
          text: "لم يتم العثور على نتائج",
        ),
      ),
    );
  }
}
