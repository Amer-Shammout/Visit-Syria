import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/data/models/city_model.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/place_details_view_body.dart';
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
          CustomSliverAppBar(images: cityModel.images, title: cityModel.title),

          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
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
        ],
      ),
    );
  }
}
