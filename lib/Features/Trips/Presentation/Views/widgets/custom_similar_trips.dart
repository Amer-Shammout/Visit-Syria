import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/similar_trips_catds_list_view.dart';

class CustomSimilarTrips extends StatelessWidget {
  const CustomSimilarTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: "الرحلات المشابهة",
      hasSeeAll: true,
      seaAllAction:
          () => GoRouter.of(context).pushNamed(
            AppRouter.kAllMiniTripCardsName,
            extra: 'الرحلات المشابهة',
          ),
      section: SimilarTripsCardsListView(),
    );
  }
}
