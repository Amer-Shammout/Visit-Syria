import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_search_data.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Manager/search_flight_offers_cubit/search_flight_offers_cubit.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flights_offers_view_body.dart';

class FlightsOffersView extends StatefulWidget {
  const FlightsOffersView({super.key, required this.flightSearchData});

  final FlightSearchData flightSearchData;

  @override
  State<FlightsOffersView> createState() => _FlightsOffersViewState();
}

class _FlightsOffersViewState extends State<FlightsOffersView> {
@override
  void initState() {
      BlocProvider.of<SearchFlightOffersCubit>(
                    context,
                  ).fetchFlightOffers(widget.flightSearchData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(hasTitle: true, title: "رحلات الطيران"),
      body: FlightsOffersViewBody(),
    );
  }
}
