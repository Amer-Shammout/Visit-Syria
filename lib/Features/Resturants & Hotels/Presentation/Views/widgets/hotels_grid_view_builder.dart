import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Places/Presentation/Manager/get_hotels_by_city_cubit/get_hotels_by_city_cubit.dart';
import 'package:visit_syria/Features/Places/Presentation/Manager/get_hotels_by_city_cubit/get_hotels_by_city_state.dart';
import 'package:visit_syria/Features/Resturants%20&%20Hotels/Presentation/Views/widgets/hotels_and_resturants_grid_view.dart';

class HotelsGridViewBuilder extends StatelessWidget {
  const HotelsGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHotelsByCityCubit, GetHotelsByCityState>(
      builder: (context, state) {
        if (state is GetHotelsByCityFailure) {
          return SliverFillRemaining(
            child: CustomErrorAndEmptyStateBody(
              illustration: Assets.illustrationsFailure,
              text: state.message,
            ),
          );
        } else if (state is GetHotelsByCitySuccess) {
          return HotelsAndResturantGridView(places: state.places);
        } else {
          return SliverFillRemaining(
            child: Center(child: CustomLoadingIndicator()),
          );
        }
      },
    );
  }
}
