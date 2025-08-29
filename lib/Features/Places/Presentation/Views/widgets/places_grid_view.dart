import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/widgets/scale_on_tap.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_card.dart';

class PlacesGridView extends StatelessWidget {
  const PlacesGridView({
    super.key,
    this.scrollPhysics = const BouncingScrollPhysics(),
    this.places,
    this.action,
  });

  final ScrollPhysics scrollPhysics;
  final List<dynamic>? places;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(right: 16, left: 16, bottom: 32),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 177 / 220,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder:
            (context, index) => ScaleOnTap(
              onTap:
                  () => GoRouter.of(context).pushNamed(
                    AppRouter.kPlaceDetailsName,
                    extra: places?[index],
                  ),
              child: PlacesCard(place: places?[index],action: action,),
            ),
        itemCount: places?.length ?? 16,
      ),
    );
  }
}
