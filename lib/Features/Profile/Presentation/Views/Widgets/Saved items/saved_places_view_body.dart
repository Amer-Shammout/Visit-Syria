import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/places_grid_view.dart';

class SavedPlacesViewBody extends StatelessWidget {
  const SavedPlacesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      slivers: [
        PlacesGridView()
      ],
    );
  }
}