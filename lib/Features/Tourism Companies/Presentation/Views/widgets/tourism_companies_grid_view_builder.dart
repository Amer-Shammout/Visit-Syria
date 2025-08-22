import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Manager/get_all_companies_cubit/get_all_companies_cubit.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/widgets/tourism_companies_cards_grid_view.dart';

class TourismCompaniesCardsGridViewBuilder extends StatelessWidget {
  const TourismCompaniesCardsGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCompaniesCubit, GetAllCompaniesState>(
      builder: (context, state) {
        if (state is GetAllCompaniesSuccess) {
          return TourismCompaniesCardsGridView(companies: state.companies);
        } else if (state is GetAllCompaniesFailure) {
          return SliverFillRemaining(
            child: CustomErrorAndEmptyStateBody(
              illustration: Assets.illustrationsFailure,
              text: state.errMessage,
              buttonText: "إعادة المحاولة",
              onTap:
                  () =>
                      BlocProvider.of<GetAllCompaniesCubit>(
                        context,
                      ).getAllCompanies(),
            ),
          );
        } else {
          return SliverFillRemaining(
            child: Center(child: CustomLoadingIndicator()),
          );
        }
      },
    );
  }
}
