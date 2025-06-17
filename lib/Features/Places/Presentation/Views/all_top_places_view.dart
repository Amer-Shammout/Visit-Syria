import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/all_top_places_view_body.dart';

class AllTopPlacesView extends StatelessWidget {
  const AllTopPlacesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "أفضل الأماكن"),
      body: AllTopPlacesViewBody(),
    );
  }
}