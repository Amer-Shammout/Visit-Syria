import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Core/widgets/all_mini_trip_cards_view_body.dart';

class AllMiniTripCardsView extends StatelessWidget {
  const AllMiniTripCardsView({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: data["title"]),
      body: AllMiniTripCardsViewBody(trips: data["trips"]),
    );
  }
}
