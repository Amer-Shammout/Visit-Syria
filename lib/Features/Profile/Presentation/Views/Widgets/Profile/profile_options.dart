import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/constants/profile_tile_constants.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/widgets/custom_tile.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: List.generate(
          kProfileItems.length,
          (index) => CustomTile(
            tileModel: kProfileItems[index],
            onTap: () => routingDrawerItem(index, context),
          ),
        ),
      ),
    );
  }

  Future<Object?>? routingDrawerItem(int index, BuildContext context) {
    switch (index) {
      case 0:
        return GoRouter.of(context).pushNamed(AppRouter.kPersonalInfoName);
      case 1:
        return null;
      case 2:
        return GoRouter.of(context).pushNamed(AppRouter.kMyTripsName);
      case 3:
        return null;
      case 4:
        return GoRouter.of(context).pushNamed(AppRouter.kMyPostsName);
      default:
        return null;
    }
  }
}
