import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Core/widgets/custom_map.dart';
import 'package:visit_syria/Features/Events/Views/widgets/event_general_info.dart';
import 'package:visit_syria/Core/widgets/image_selector.dart';
import 'package:visit_syria/Features/Events/Views/widgets/small_events_cards_list_view.dart';

class EventDetailsViewBody extends StatelessWidget {
  const EventDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ImageSelector(
            images: [
              Assets.imagesTest,
              Assets.imagesAzemPalace,
              Assets.imagesIdlib,
              Assets.imagesRasafe,
            ],
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
        SliverToBoxAdapter(child: EventGenerlInfo()),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
        SliverToBoxAdapter(
          child: CustomDescription(
            desc:
                ' في منطقة مرمريتا بسوريا. يشتهر المهرجان بتنظيم فعاليات متنوعة تشمل عروض موسيقية، فنية، ومسرحية، بالإضافة إلى أنشطة ثقافية تهدف إلى تعزيز التراث المحلي والتقاليد السورية.',
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
        SliverToBoxAdapter(
          child: CustomMap(latitude: 33.5138, longitude: 36.2765),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
        SliverToBoxAdapter(
          child: CustomSection(
            section: SmallEventsCardListView(),
            title: "الأحداث الرائجة",
            hasSeeAll: true,
            seaAllAction:
                () => GoRouter.of(context).pushNamed(AppRouter.kAllEventsName),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
      ],
    );
  }
}
