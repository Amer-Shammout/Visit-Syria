import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/widgets/tourism_companies_view_body.dart';

class TourismCompaniesView extends StatelessWidget {
  const TourismCompaniesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "شركات السياحة"),
      body: TourismCompaniesViewBody(),
    );
  }
}
