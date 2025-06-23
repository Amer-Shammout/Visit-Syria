import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Resturants%20&%20Hotels/Presentation/Views/widgets/similar_hotels_or_resturants_view_body.dart';

class SimilarHotelsOrResturantsView extends StatelessWidget {
  const SimilarHotelsOrResturantsView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: title),
      body: SimialarHotelsOrResturantsViewBody(),
    );
  }
}
