import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/back_flight_item.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/go_flight_item.dart';

class FlightsOfferCardDetails extends StatelessWidget {
  const FlightsOfferCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GoFlightItem(),
        SizedBox(height: AppSpacing.s24),
        BackFlightItem(),
      ],
    );
  }
}
