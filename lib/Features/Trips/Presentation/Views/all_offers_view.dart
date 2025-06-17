import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/all_offers_view_body.dart';

class AllOffersView extends StatelessWidget {
  const AllOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: 'العروض'),
      body: AllOffersViewBody(),
    );
  }
}
