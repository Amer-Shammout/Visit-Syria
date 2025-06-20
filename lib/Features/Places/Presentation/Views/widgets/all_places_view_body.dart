import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/places_grid_view.dart';

class AllPlacesViewBody extends StatelessWidget {
  const AllPlacesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [PlacesGridView()]);
  }
}
