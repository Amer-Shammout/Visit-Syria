import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Places/Presentation/Manager/get_places_by_classification_and_city_cubit/get_places_by_classification_and_city_cubit.dart';
import 'package:visit_syria/Features/Places/Presentation/Manager/get_places_by_classification_and_city_cubit/get_places_by_classification_and_city_state.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/places_grid_view.dart';

class PlacesGridViewBuilder extends StatelessWidget {
  const PlacesGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetPlacesByClassificationAndCityCubit,
      GetPlacesByClassificationAndCityState
    >(
      builder: (context, state) {
        if (state is GetPlacesByClassificationAndCityFailure) {
          return SliverFillRemaining(
            child: CustomErrorAndEmptyStateBody(
              illustration: Assets.illustrationsFailure,
              text: state.message,
            ),
          );
        } else if (state is GetPlacesByClassificationAndCitySuccess) {
          return PlacesGridView(places: state.places);
        } else if (state is GetPlacesByClassificationAndCityEmpty) {
          return SliverFillRemaining(
            child: CustomErrorAndEmptyStateBody(
              illustration: Assets.illustrationsEmptyTrips,
              text: "لا يوجد أماكن في هذا التصنيف",
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
