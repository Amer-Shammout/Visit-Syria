import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Manager/search_flight_offers_cubit/search_flight_offers_cubit.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Manager/search_flight_offers_cubit/search_flight_offers_state.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flight_offers_list_view.dart';

class FlightsOffersViewBodyBuilder extends StatelessWidget {
  const FlightsOffersViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchFlightOffersCubit, SearchFlightOffersState>(
      builder: (context, state) {
        if (state is SearchFlightOffersSuccess) {
          return FlightOffersListView(flightOffers: state.flights);
        } else if (state is SearchFlightOffersFailure) {
          return CustomErrorAndEmptyStateBody(
            illustration: Assets.illustrationsFailure,
            text: state.message,
          );
        } else if (state is SearchFlightOffersEmpty) {
          return CustomErrorAndEmptyStateBody(
            illustration: Assets.illustrationsFlightsSearch,
            text: "لم يتم العثور على رحلات!",
          );
        } else {
          return Center(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
