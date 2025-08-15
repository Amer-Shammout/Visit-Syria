import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/big_back_flight_item.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/big_go_flight_item.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flight_general_info.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flight_segements_item.dart';

class FlightOfferDetailsViewBody extends StatelessWidget {
  const FlightOfferDetailsViewBody({super.key, required this.flightOffer});

  final FlightModel flightOffer;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: [
        BigGoFlightItem(flightOffer: flightOffer),
        flightOffer.isRoundTrip!
            ? SizedBox(height: AppSpacing.s24)
            : SizedBox.shrink(),
        flightOffer.isRoundTrip!
            ? BigBackFlightItem(flightOffer: flightOffer)
            : SizedBox.shrink(),
        SizedBox(height: AppSpacing.s24),
        FlightGeneralInfo(flightModel: flightOffer),
        SizedBox(height: AppSpacing.s32),
        FlightSegementsItem(segments: flightOffer.departureModel!.segments!),
      ],
    );
  }
}
