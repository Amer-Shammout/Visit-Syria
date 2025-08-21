import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/places_grid_view.dart';

class AllPlacesViewBody extends StatelessWidget {
  const AllPlacesViewBody({super.key, required this.places});
  final List<PlaceModel> places;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      slivers: [PlacesGridView(places: places)],
    );
  }
}
