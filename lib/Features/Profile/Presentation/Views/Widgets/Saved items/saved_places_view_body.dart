import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Saved%20items/saved_places_list_view_builder.dart';

class SavedPlacesViewBody extends StatelessWidget {
  const SavedPlacesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      slivers: [SavedPlacesListViewBuilder()],
    );
  }
}
