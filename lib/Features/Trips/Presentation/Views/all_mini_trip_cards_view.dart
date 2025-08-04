import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Core/widgets/all_mini_trip_cards_view_body.dart';

class AllMiniTripCardsView extends StatelessWidget {
  const AllMiniTripCardsView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: title),
      body: AllMiniTripCardsViewBody(),
    );
  }
}
