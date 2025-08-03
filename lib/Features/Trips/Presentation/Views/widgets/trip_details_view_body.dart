import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Core/widgets/custom_sliver_app_bar.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_and_blogs_tags_wrap.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_floating_action_button.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_improvements.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_map_with_path.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_similar_trips.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_time_line.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_card_general_info.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_card_header.dart';

class TripDetailsViewBody extends StatelessWidget {
  const TripDetailsViewBody({super.key});

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
                title: " رحلة في سوريا اوعى تجي او ترجع",
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TripsCardGeneralInfo.TripGeneralInfo(),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomTourismCompanyRow(),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PostandBlogsTagsWrap(
                    tags: ["ترفيهي", "طبيعي", "اللاذقية", "طرطوس", "بانياس"],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(
                child: CustomDescription(
                  desc:
                      "انضم إلينا في رحلة لا تُنسى إلى السواحل السورية، حيث تمتد الرمال الذهبية على طول البحر، وتحتضن المدن الساحلية كـ اللاذقية وطرطوس عبق التاريخ وروعة الطبيعة.",
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(child: CustomImprovements()),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(
                child: CustomMapWithPath(
                  routePoints: [
                    LatLng(33.5138, 36.2765), // دمشق
                    LatLng(35.5196, 35.7916), // اللاذقية
                    LatLng(34.8021, 38.9968), // دير الزور
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(child: CustomTimeLine()),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(child: CustomSimilarTrips()),
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
