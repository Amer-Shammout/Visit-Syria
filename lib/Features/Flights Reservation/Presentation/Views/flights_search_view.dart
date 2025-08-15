import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flights_search_view_body.dart';

class FlightsSearchView extends StatelessWidget {
  const FlightsSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(hasTitle: true, title: "حجوزات الطيران"),
      body: FlightsSearchViewBody(),
    );
  }
}
