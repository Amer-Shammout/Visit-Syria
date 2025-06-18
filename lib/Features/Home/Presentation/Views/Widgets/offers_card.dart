import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/widgets/custom_card_background.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/offers_card_details.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/offers_card_image.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 272,
      child: AspectRatio(
        aspectRatio: 200 / 272,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomCardBackground(),
            Positioned(
              bottom: 8,
              right: 8,
              left: 8,
              child: OffersCardDetails(),
            ),

            Positioned(top: 8, right: 8, left: 8, child: OffersCardImage()),
          ],
        ),
      ),
    );
  }
}
