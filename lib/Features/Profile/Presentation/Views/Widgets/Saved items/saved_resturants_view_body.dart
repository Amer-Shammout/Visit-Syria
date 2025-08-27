import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Saved%20items/saved_resturants_list_view_builder.dart';

class SavedResturantsViewBody extends StatelessWidget {
  const SavedResturantsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      slivers: [SavedResturantsListViewBuilder()],
    );
  }
}
