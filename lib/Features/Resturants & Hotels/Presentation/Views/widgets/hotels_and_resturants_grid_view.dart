import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_card.dart';

class HotelsAndResturantGridView extends StatelessWidget {
  const HotelsAndResturantGridView({super.key, this.places});

  final List<dynamic>? places;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(right: 16, left: 16, bottom: 32, top: 16),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 177 / 220,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder:
            (context, index) => GestureDetector(
              onTap:
                  () => GoRouter.of(context).pushNamed(
                    AppRouter.kHotelsAndResturantsDetailsName,
                    extra: places?[index],
                  ),
              child: PlacesCard(place: places?[index]),
            ),
        itemCount: places?.length ?? 10,
      ),
    );
  }
}
