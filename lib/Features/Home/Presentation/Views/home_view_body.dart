import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Home/Data/Models/weather_model.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/events_carousel.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/offers_cards_list_view.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_cards_hor_list_view.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/weather_cards_list_view.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, this.weathers, this.places, this.events});
  final List<WeatherModel>? weathers;
  final List<PlaceModel>? places;
  final List<EventModel>? events;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
        SliverToBoxAdapter(
          child: WeatherCardsListView(weatherCards: weathers!),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s24)),
        SliverToBoxAdapter(
          child: CustomSection(
            section: EventsCarousel(events: events!),

            hasSeeAll: true,
            title: "الأحداث الرائجة",
            icon: Assets.iconsEvents,
            seaAllAction:
                () => GoRouter.of(
                  context,
                ).pushNamed(AppRouter.kAllEventsName, extra: events),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s24)),

        SliverToBoxAdapter(
          child: CustomSection(
            section: OffersCardsListView(trips: []),
            hasSeeAll: true,
            title: "العروض",
            seaAllAction:
                () => GoRouter.of(
                  context,
                ).pushNamed(AppRouter.kAllMiniTripCardsName, extra: 'العروض'),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s24)),

        SliverToBoxAdapter(
          child: CustomSection(
            section: PlacesCardsHorListView(places: places!),
            hasSeeAll: true,
            title: "أفضل الأماكن",
            seaAllAction:
                () => GoRouter.of(
                  context,
                ).pushNamed(AppRouter.kAllPlacesName, extra: places!),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s24)),
      ],
    );
  }
}
