import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/widgets/custom_section.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/events_carousel.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/weather_cards_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
        SliverToBoxAdapter(child: WeatherCardsListView()),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
        SliverToBoxAdapter(
          child: CustomSection(
            section: EventsCarousel(),
            hasSeeAll: true,
            title: "الأحداث الرائجة",
            icon: Assets.iconsEvents,
            seaAllAction: () {},
          ),
        ),

        // SliverToBoxAdapter(child: EventsCarousel(),)
      ],
    );
  }
}
