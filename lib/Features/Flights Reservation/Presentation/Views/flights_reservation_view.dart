import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flights_reservation_view_body.dart';

class FlightsReservationView extends StatelessWidget {
  const FlightsReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(hasTitle: true,title: "حجوزات الطيران",),
      body: FlightsReservationViewBody(),
    );
  }
}