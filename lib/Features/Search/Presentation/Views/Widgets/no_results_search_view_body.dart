import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Features/Search/Presentation/Manager/search_cubit/search_cubit.dart';

class NoResultsSearchViewBody extends StatelessWidget {
  const NoResultsSearchViewBody({super.key});

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

class ErrorSearchViewBody extends StatelessWidget {
  const ErrorSearchViewBody({
    super.key,
    required this.message,
    required this.onTap,
  });
  final String message;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: CustomErrorAndEmptyStateBody(
          illustration: Assets.illustrationsFailure,
          text: message,
          buttonText: "إعادة المحاولة",
          onTap: () => context.read<SearchCubit>().doSearch(),
        ),
      ),
    );
  }
}
