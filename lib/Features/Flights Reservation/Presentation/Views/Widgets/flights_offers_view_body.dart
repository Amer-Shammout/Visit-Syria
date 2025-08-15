import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flights_offers_card.dart';

class FlightsOffersViewBody extends StatelessWidget {
  const FlightsOffersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => FlightsOffersCard(),
      itemCount: 10,
      clipBehavior: Clip.none,
      physics: BouncingScrollPhysics(),
    );
  }
}
