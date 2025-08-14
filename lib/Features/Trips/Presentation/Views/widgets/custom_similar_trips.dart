import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/similar_trips_catds_list_view.dart';

class CustomMiniTripsSection extends StatelessWidget {
  const CustomMiniTripsSection({
    super.key,
    required this.trips,
    required this.title,
  });
  final List<TripModel> trips;
  final String title;
  @override
  Widget build(BuildContext context) {
    bool hasSeeAll = trips.length > 5 ? true : false;
    return CustomSection(
      title: title,
      hasSeeAll: hasSeeAll,
      seaAllAction:
          () => GoRouter.of(context).pushNamed(
            AppRouter.kAllMiniTripCardsName,
            extra: {"title": title, "trips": trips},
          ),
      section: MiniTripsCardsListView(trips: trips, hasSeeAll: hasSeeAll),
    );
  }
}
