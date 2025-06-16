import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/widgets/custom_section.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/events_carousel.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/offers_cards_list_view.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/top_places_cards_list_view.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/weather_cards_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
        SliverToBoxAdapter(child: WeatherCardsListView()),
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
            seaAllAction: () {},
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s24)),

        SliverToBoxAdapter(
          child: CustomSection(
            section: TopPlacesCardsListView(),
            hasSeeAll: true,
            title: "أفضل الأماكن",
            seaAllAction: () {},
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s24)),
      ],
    );
  }
}
