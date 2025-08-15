import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Manager/search_airports_cubit/search_airports_cubit.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Manager/search_airports_cubit/search_airports_state.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/error_airport_search_view_body.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/initial_airport_search_view_body.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/results_airport_search_view_body.dart';

class AirportsSearchViewBodyBuilder extends StatelessWidget {
  const AirportsSearchViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchAirportsCubit, SearchAirportsState>(
      builder: (context, state) {
        if (state is SearchAirportsSuccess) {
          return ResultsAirportSearchViewBody(airports: state.airports);
        } else if (state is SearchAirportsFailure) {
          return ErrorAirportSearchViewBody(message: state.message);
        } else if (state is SearchAirportsEmpty) {
          return ErrorAirportSearchViewBody(
            message: "لم يتم العثور على نتائج!",
          );
        } else if (state is SearchAirportsInitial) {
          return InitialAirportSearchViewBody();
        } else {
          return SliverFillRemaining(
            child: Center(child: CustomLoadingIndicator()),
          );
        }
      },
    );
  }
}
