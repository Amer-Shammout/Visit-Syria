import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/scale_on_tap.dart';
import 'package:visit_syria/Features/Profile/Data/Models/my_booking_model/my_booking_model.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/My%20Trips/my_trip_card.dart';

class MyTripsCardsListView extends StatelessWidget {
  const MyTripsCardsListView({super.key, required this.bookings});
  final List<MyBookingModel> bookings;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
      physics: BouncingScrollPhysics(),
      itemBuilder:
          (context, index) => ScaleOnTap(
            onTap:
                () => GoRouter.of(context).pushNamed(
                  AppRouter.kMyTripDetailsName,
                  extra: bookings[index],
                ),
            child: MyTripCard(myBookingModel: bookings[index]),
          ),
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s16),
      itemCount: bookings.length,
    );
  }
}
