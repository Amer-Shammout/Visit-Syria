import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_card_background.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/offers_card_details.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_card_image.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 272,
      child: AspectRatio(
        aspectRatio: 200 / 272,
        child: CustomCardBackground(
          padding: 8,
          child: Column(
            children: [
              TripsCardImage(positionedVal: 8, imageHeight: 150),
              SizedBox(height: AppSpacing.s16),
              OffersCardDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
