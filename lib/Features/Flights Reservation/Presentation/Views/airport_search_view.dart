import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/airport_search_view_body.dart';

class AirportSearchView extends StatelessWidget {
  const AirportSearchView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(hasTitle: true, title: title),
      body: AirportSearchViewBody(),
    );
  }
}
