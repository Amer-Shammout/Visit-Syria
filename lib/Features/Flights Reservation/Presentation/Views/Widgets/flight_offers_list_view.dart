import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flights_offers_card.dart';

class FlightOffersListView extends StatelessWidget {
  const FlightOffersListView({super.key, required this.flightOffers});

  final List<FlightModel> flightOffers;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:
          (context, index) =>
              GestureDetector(
                onTap: () => GoRouter.of(context).pushNamed(AppRouter.kFlightsOffeDetailssName,extra: flightOffers[index]),
                child: FlightsOffersCard(flightOffer: flightOffers[index])),
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s16),
      itemCount: flightOffers.length,
      clipBehavior: Clip.none,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
