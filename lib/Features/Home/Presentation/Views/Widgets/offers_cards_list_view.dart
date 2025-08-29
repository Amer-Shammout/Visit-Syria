import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/mini_trip_card.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';

class OffersCardsListView extends StatelessWidget {
  const OffersCardsListView({super.key, required this.trips});
  final List<TripModel> trips;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsetsDirectional.only(
                start: index == 0 ? 16 : 0,
                end: index == 5 ? 16 : 0,
              ),
              child: GestureDetector(
                onTap:
                    () => GoRouter.of(context).pushNamed(
                      AppRouter.kTripDetailsName,
                      extra: <String, dynamic>{'trip': trips[index]},
                    ),
                child: MiniTripCard(tripModel: trips[index]),
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(width: AppSpacing.s16),
        itemCount: trips.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
