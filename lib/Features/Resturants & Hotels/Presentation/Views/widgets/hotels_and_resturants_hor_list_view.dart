import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_card.dart';

class HotelAndResturantsHorListView extends StatelessWidget {
  const HotelAndResturantsHorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsetsDirectional.only(
                start: index == 0 ? 16 : 0,
                end: index == 5 ? 16 : 0,
              ),
              child: GestureDetector(
                onTap:
                    () => GoRouter.of(
                      context,
                    ).pushNamed(AppRouter.kHotelsAndResturantsDetailsName),
                child: PlacesCard(),
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(width: AppSpacing.s16),
        itemCount: 6,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
