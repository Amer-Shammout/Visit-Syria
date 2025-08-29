import 'package:flutter/material.dart';

import 'package:visit_syria/Features/Profile/Data/Models/my_booking_model/my_booking_model.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/My%20Trips/my_trip_details_view_body.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/MyReservation/reservation_consumer.dart.dart';

class MyTripDetailsView extends StatelessWidget {
  const MyTripDetailsView({super.key, required this.myBookingModel});
  final MyBookingModel myBookingModel;
  @override
  Widget build(BuildContext context) {
    return ReservationConsumer(
      type: 'trip',
      widget: MyTripDetailsViewBody(myBookingModel: myBookingModel),
    );
  }
}
