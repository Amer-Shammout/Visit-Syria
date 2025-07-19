import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/constants/saved_items_constants.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Saved%20items/saved_items_card.dart';

class SavedItemsGridView extends StatelessWidget {
  const SavedItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(right: 16, left: 16, bottom: 32),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder:
            (context, index) => GestureDetector(
              onTap: () => routingSavedItemItem(index, context),
              child: SavedItemsCard(savedItemModel: kSavedItems[index]),
            ),
        itemCount: kSavedItems.length,
      ),
    );
  }

  Future<Object?>? routingSavedItemItem(int index, BuildContext context) {
    switch (index) {
      case 0:
        return GoRouter.of(context).pushNamed(AppRouter.kSavedEventsName);
      case 1:
        return GoRouter.of(context).pushNamed(AppRouter.kSavedTripsName);
      case 2:
        return GoRouter.of(context).pushNamed(AppRouter.kSavedPlacesName);
      case 3:
        return GoRouter.of(context).pushNamed(AppRouter.kSavedResturantsName);
      case 4:
        return GoRouter.of(context).pushNamed(AppRouter.kSavedHotelsName);
      case 5:
        return GoRouter.of(context).pushNamed(AppRouter.kSavedBlogsName);
      case 6:
        return GoRouter.of(context).pushNamed(AppRouter.kSavedPostsName);
      default:
        return null;
    }
  }
}
