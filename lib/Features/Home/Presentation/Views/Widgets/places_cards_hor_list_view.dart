import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/scale_on_tap.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_card.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';

class PlacesCardsHorListView extends StatelessWidget {
  const PlacesCardsHorListView({super.key, required this.places});

  final List<PlaceModel> places;

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
              child: ScaleOnTap(
                onTap:
                    () => GoRouter.of(context).pushNamed(
                      AppRouter.kPlaceDetailsName,
                      extra: places[index],
                    ),
                child: PlacesCard(place: places[index]),
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(width: AppSpacing.s16),
        itemCount: places.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
