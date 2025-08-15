import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_card_background.dart';
import 'package:visit_syria/Core/widgets/mini_trip_card_details.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_card_image.dart';

class MiniTripCard extends StatelessWidget {
  const MiniTripCard({super.key, required this.tripModel});
  final TripModel tripModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: CustomCardBackground(
          padding: 8,
          child: Column(
            children: [
              TripsCardImage(
                positionedVal: 8,
                imageHeight: 150,
                discount: tripModel.discount!,
                title: tripModel.name,
              ),
              SizedBox(height: AppSpacing.s16),
              MiniTripCardDetails(tripModel: tripModel),
            ],
          ),
        ),
      ),
    );
  }
}
