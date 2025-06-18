import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/places_grid_view.dart';

class AllTopPlacesViewBody extends StatelessWidget {
  const AllTopPlacesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers:[ PlacesGridView()]);
  }
}

