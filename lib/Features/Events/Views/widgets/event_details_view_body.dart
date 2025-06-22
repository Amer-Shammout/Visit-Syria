import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Core/widgets/custom_map.dart';
import 'package:visit_syria/Core/widgets/custom_sliver_app_bar.dart';
import 'package:visit_syria/Features/Events/Views/widgets/event_general_info.dart';
import 'package:visit_syria/Features/Events/Views/widgets/small_events_cards_list_view.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_floating_action_button.dart';

class EventDetailsViewBody extends StatelessWidget {
  const EventDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              CustomSliverAppBar(
                images: [
                  Assets.imagesTest,
                  Assets.imagesAzemPalace,
                  Assets.imagesIdlib,
                  Assets.imagesRasafe,
                ],
                title: "الحدث الخارق",
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
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
                      () => GoRouter.of(
                        context,
                      ).pushNamed(AppRouter.kAllEventsName),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 96)),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: CustomFloatingActionButton(),
          ),
        ],
      ),
    );
  }
}
