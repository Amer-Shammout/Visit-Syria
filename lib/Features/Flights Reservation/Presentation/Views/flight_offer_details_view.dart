import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flight_offer_details_view_body.dart';

class FlightOfferDetailsView extends StatelessWidget {
  const FlightOfferDetailsView({super.key, required this.flightModel});

  final FlightModel flightModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(hasTitle: false),
      body: FlightOfferDetailsViewBody(flightOffer: flightModel),
    );
  }
}
