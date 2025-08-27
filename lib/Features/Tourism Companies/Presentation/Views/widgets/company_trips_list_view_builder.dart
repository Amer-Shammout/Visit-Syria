import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Data/Models/company_model.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_cards_list_view.dart';
import 'package:visit_syria/Features/Trips/Presentation/manager/get_company_trips_cubit/get_company_trips_cubit.dart';

class CompanyTripsListViewBuilder extends StatelessWidget {
  const CompanyTripsListViewBuilder({
    super.key,
    required this.category,
    required this.companyModel,
  });
  final String category;
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCompanyTripsCubit, GetCompanyTripsState>(
      builder: (context, state) {
        if (state is GetCompanyTripSuccess) {
          return TripsCardsListView(trips: state.companyTrips);
        }
        if (state is GetCompanyTripsEmpty) {
          return CustomErrorAndEmptyStateBody(
            illustration: Assets.illustrationsEmptyTrips,
            text: 'لا يوجد رحلات حالياً',
          );
        }
        if (state is GetCompanyTripsFailure) {
          return CustomErrorAndEmptyStateBody(
            illustration: Assets.illustrationsFailure,
            text: state.errMessage,
            onTap:
                () => BlocProvider.of<GetCompanyTripsCubit>(
                  context,
                ).getCompanyTrips(companyModel.id!, category),
            buttonText: "أعادة المحاولة",
          );
        }
        return Center(child: CustomLoadingIndicator());
      },
    );
  }
}
