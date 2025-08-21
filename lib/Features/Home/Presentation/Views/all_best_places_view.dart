import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/all_best_places_view_body.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';

class AllPlacesView extends StatelessWidget {
  const AllPlacesView({super.key, required this.places});
  final List<PlaceModel> places;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(hasTitle: true, title: "أفضل الأماكن"),
      body: AllPlacesViewBody(places: places),
    );
  }
}
