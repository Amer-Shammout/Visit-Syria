import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/all_places_view_body.dart';

class AllPlacesView extends StatelessWidget {
  const AllPlacesView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: title),
      body: AllPlacesViewBody(),
    );
  }
}
