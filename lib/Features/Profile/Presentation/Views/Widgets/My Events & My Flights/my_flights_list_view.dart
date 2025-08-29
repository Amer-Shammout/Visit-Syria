import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/scale_on_tap.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flights_offers_card.dart';
import 'package:visit_syria/Features/Profile/Data/Models/my_booking_model/my_booking_model.dart';

class MyFlightsListView extends StatelessWidget {
  const MyFlightsListView({super.key, required this.bookings});
  final List<MyBookingModel> bookings;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
      physics: BouncingScrollPhysics(),
      itemBuilder:
          (context, index) => ScaleOnTap(
            onTap: () {
              bookings[index].category = bookings[0].category;
              log(bookings[index].category!);
              GoRouter.of(context).pushNamed(
                AppRouter.kMyFlightDetailsName,
                extra: bookings[index],
              );
            },
            child: FlightsOffersCard(flightOffer: bookings[index].info),
          ),
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s16),
      itemCount: bookings.length,
    );
  }
}
