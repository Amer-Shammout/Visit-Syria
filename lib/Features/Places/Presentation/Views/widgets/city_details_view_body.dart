import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/data/models/city_model.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Core/widgets/image_selector.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/places_grid_view.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';

class CityDetailsViewBody extends StatelessWidget {
  const CityDetailsViewBody({super.key, required this.cityModel});

  final CityModel cityModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 360 + (MediaQuery.sizeOf(context).width - 56) / 4,
            pinned: true,
            floating: true,
            backgroundColor: AppColors.whiteColor,
            automaticallyImplyLeading: false,
            surfaceTintColor: AppColors.whiteColor,
            toolbarHeight: 0,

            flexibleSpace: FlexibleSpaceBar(
              background: ImageSelector(
                title: cityModel.title,
                images: cityModel.images,
                hasActionButton: false,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
          SliverToBoxAdapter(child: CustomDescription(desc: cityModel.desc)),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s20)),
          PinnedHeaderSliver(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              color: AppColors.whiteColor,
              child: CustomSection(
                title: "الأماكن",
                hasSeeAll: false,
                section: TagsListView(
                  data: ["أثري", "ديني", "ثقافي", "ثراثي", "ترفيهي"],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s12)),
          PlacesGridView(),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
        ],
      ),
    );
  }
}
