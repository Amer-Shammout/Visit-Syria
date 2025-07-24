import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/events_carousel.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/offers_cards_list_view.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_cards_hor_list_view.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/weather_cards_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
        SliverToBoxAdapter(child: WeatherCardsBuilder()),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s24)),
        SliverToBoxAdapter(
          child: CustomSection(
            section: EventsCarousel(),
            hasSeeAll: true,
            title: "الأحداث الرائجة",
            icon: Assets.iconsEvents,
            seaAllAction:
                () => GoRouter.of(context).pushNamed(AppRouter.kAllEventsName),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s24)),

        SliverToBoxAdapter(
          child: CustomSection(
            section: OffersCardsListView(),
            hasSeeAll: true,
            title: "العروض",
            seaAllAction:
                () => GoRouter.of(context).pushNamed(AppRouter.kAllOffersName),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s24)),

        SliverToBoxAdapter(
          child: CustomSection(
            section: PlacesCardsHorListView(),
            hasSeeAll: true,
            title: "أفضل الأماكن",
            seaAllAction:
                () => GoRouter.of(
                  context,
                ).pushNamed(AppRouter.kAllPlacesName, extra: "أفضل الأماكن"),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s24)),
      ],
    );
  }
}
