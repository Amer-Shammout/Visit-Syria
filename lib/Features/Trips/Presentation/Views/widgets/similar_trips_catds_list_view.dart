import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/mini_trip_card.dart';
import 'package:visit_syria/Core/widgets/scale_on_tap.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';

class MiniTripsCardsListView extends StatelessWidget {
  const MiniTripsCardsListView({
    super.key,
    required this.trips,
    required this.hasSeeAll,
  });
  final List<TripModel> trips;
  final bool hasSeeAll;
  @override
  Widget build(BuildContext context) {
    int lastIndex = !hasSeeAll ? trips.length - 1 : 4;
    return SizedBox(
      height: 280,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsetsDirectional.only(
                start: index == 0 ? 16 : 0,
                end: index == lastIndex ? 16 : 0,
              ),
              child: ScaleOnTap(
                onTap:
                    () => GoRouter.of(context).pushNamed(
                      AppRouter.kTripDetailsName,
                      extra: trips[index],
                    ),
                child: MiniTripCard(tripModel: trips[index]),
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(width: AppSpacing.s16),
        itemCount: !hasSeeAll ? trips.length : 5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
