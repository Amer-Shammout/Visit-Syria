import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Profile/Data/Models/my_booking_model/my_booking_model.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/My%20Events%20&%20My%20Flights/my_event_details_view_body.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/MyReservation/reservation_consumer.dart.dart';

class MyEventDetailsView extends StatelessWidget {
  const MyEventDetailsView({super.key, required this.myBookingModel});
  final MyBookingModel myBookingModel;
  @override
  Widget build(BuildContext context) {
    return ReservationConsumer(
      category: myBookingModel.category!,
      widget: MyEventDetailsViewBody(myBookingModel: myBookingModel),
      type: 'event',
    );
  }
}
