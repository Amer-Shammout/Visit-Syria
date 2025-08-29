import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_card.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_cards_list_view.dart';
import 'package:visit_syria/Features/Trips/Presentation/manager/get_trips_by_category_cubit/get_trips_by_category_cubit.dart';

class TripsCardsListViewBuilder extends StatelessWidget {
  const TripsCardsListViewBuilder({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTripsByCategoryCubit, GetTripsByCategoryState>(
      builder: (context, state) {
        if (state is GetTripsByCategorySuccess) {
          return CustomSaveMultiBlocListener(
            child: TripsCardsListView(trips: state.trips),
          );
        } else if (state is GetTripsByCategoryEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.illustrationsEmptyTrips),
              SizedBox(height: AppSpacing.s16),
              Text(
                "لا يوجد رحلات حالياً",
                style: AppStyles.fontsRegular16(
                  context,
                ).copyWith(color: AppColors.titleTextColor),
              ),
            ],
          );
        } else if (state is GetTripsByCategoryFailure) {
          return CustomErrorAndEmptyStateBody(
            illustration: Assets.illustrationsFailure,
            text: state.errMessage,
            onTap:
                () => BlocProvider.of<GetTripsByCategoryCubit>(
                  context,
                ).getTripsByCategory(category),
            buttonText: "أعادة المحاولة",
          );
        } else {
          return Center(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
