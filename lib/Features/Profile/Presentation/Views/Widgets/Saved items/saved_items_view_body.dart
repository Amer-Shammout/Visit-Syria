import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Saved%20items/saved_items_grid_view.dart';

class SavedItemsViewBody extends StatelessWidget {
  const SavedItemsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      clipBehavior: Clip.none,
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s2)),
        SavedItemsGridView(),
      ],
    );
  }
}
