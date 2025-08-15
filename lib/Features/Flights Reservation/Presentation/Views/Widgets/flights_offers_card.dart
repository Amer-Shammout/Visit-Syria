import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_card_background.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flights_offer_card_header.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flights_offers_card_details.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flights_offers_card_footer.dart';

class FlightsOffersCard extends StatelessWidget {
  const FlightsOffersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCardBackground(
      color: Colors.transparent,
      padding: 16,
      image: Assets.imagesFlightsCard,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlightsOfferCardHeader(),
          SizedBox(height: AppSpacing.s24),
          FlightsOfferCardDetails(),
          SizedBox(height: AppSpacing.s24),
          FlightsOffersCardFooter(),
        ],
      ),
    );
  }
}
