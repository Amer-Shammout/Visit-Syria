import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_cards_list_view.dart';
import 'package:visit_syria/Features/Trips/Presentation/manager/get_trips_by_category_cubit/get_trips_by_category_cubit.dart';

class TripsCardsListViewBuilder extends StatelessWidget {
  const TripsCardsListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTripsByCategoryCubit, GetTripsByCategoryState>(
      builder: (context, state) {
        if (state is GetTripsByCategorySuccess) {
          return TripsCardsListView(trips: state.trips);
        }
        if (state is GetTripsByCategoryEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.illustrationsEmptyTrips),
              SizedBox(height: AppSpacing.s16),
              Text("لا يوجد رحلات حالياً"),
            ],
          );
        }
        if (state is GetTripsByCategoryFailure) {
          return Column(
            children: [
              Center(child: Text(state.errMessage)),
              CustomButton(
                onPressed:
                    () => BlocProvider.of<GetTripsByCategoryCubit>(
                      context,
                    ).getTripsByCategory("الكل"),
                title: "إعادة المحاولة",
                textStyle: AppStyles.fontsBold14(
                  context,
                ).copyWith(color: AppColors.whiteColor),
              ),
            ],
          );
        }
        return Center(child: CustomLoadingIndicator());
      },
    );
  }
}
