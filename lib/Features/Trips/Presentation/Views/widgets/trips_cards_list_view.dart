import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/scale_on_tap.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_card.dart';

class TripsCardsListView extends StatelessWidget {
  const TripsCardsListView({super.key, required this.trips});
  final List<TripModel> trips;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16),
      physics: BouncingScrollPhysics(),
      itemBuilder:
          (context, index) => ScaleOnTap(
            onTap:
                () => GoRouter.of(
                  context,
                ).pushNamed(AppRouter.kTripDetailsName, extra: trips[index]),
            child: TripsCard(tripModel: trips[index]),
          ),
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s16),
      itemCount: trips.length,
    );
  }
}
