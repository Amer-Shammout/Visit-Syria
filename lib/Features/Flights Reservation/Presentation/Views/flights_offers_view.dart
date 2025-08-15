import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flights_offers_view_body.dart';

class FlightsOffersView extends StatelessWidget {
  const FlightsOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(hasTitle: true, title: "رحلات الطيران"),
      body: FlightsOffersViewBody(),
    );
  }
}
