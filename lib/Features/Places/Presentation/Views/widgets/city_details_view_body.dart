import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/data/models/city_model.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Core/widgets/custom_sliver_app_bar.dart';
import 'package:visit_syria/Features/Places/Presentation/Manager/get_places_by_classification_and_city_cubit/get_places_by_classification_and_city_cubit.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/places_grid_view_builder.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';

class CityDetailsViewBody extends StatefulWidget {
  const CityDetailsViewBody({super.key, required this.cityModel});

  final CityModel cityModel;

  @override
  State<CityDetailsViewBody> createState() => _CityDetailsViewBodyState();
}

class _CityDetailsViewBodyState extends State<CityDetailsViewBody> {
  String? currentClassification = "أثرية";
  @override
  void initState() {
    BlocProvider.of<GetPlacesByClassificationAndCityCubit>(
      context,
    ).fetchPlaces(currentClassification!, widget.cityModel.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(
            images: widget.cityModel.images,
            title: widget.cityModel.title,
            hasActionButton: false,
            hasRate: false,
          ),

          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
          SliverToBoxAdapter(
            child: CustomDescription(desc: widget.cityModel.desc),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s20)),
          PinnedHeaderSliver(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              color: AppColors.whiteColor,
              child: CustomSection(
                title: "الأماكن",
                hasSeeAll: false,
                section: TagsListView(
                  onTagSelected:
                      (value, index) => BlocProvider.of<
                        GetPlacesByClassificationAndCityCubit
                      >(context).fetchPlaces(value, widget.cityModel.title),
                  data: ["أثرية", "طبيعية", "ثقافي", "ثراثي", "ترفيهي"],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s12)),
          PlacesGridViewBuilder(
            tag: currentClassification!,
            city: widget.cityModel.title,
          ),
        ],
      ),
    );
  }
}
