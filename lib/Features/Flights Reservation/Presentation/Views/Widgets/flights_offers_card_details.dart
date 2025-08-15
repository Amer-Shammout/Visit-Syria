import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/back_flight_item.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/go_flight_item.dart';

class FlightsOfferCardDetails extends StatelessWidget {
  const FlightsOfferCardDetails({super.key, required this.flightOffer});

  final FlightModel flightOffer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GoFlightItem(flightOffer: flightOffer),
        flightOffer.isRoundTrip!
            ? SizedBox(height: AppSpacing.s24)
            : SizedBox.shrink(),
        flightOffer.isRoundTrip!
            ? BackFlightItem(flightOffer: flightOffer)
            : SizedBox.shrink(),
      ],
    );
  }
}
