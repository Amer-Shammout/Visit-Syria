import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Core/widgets/custom_map.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Core/widgets/custom_sliver_app_bar.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_cards_hor_list_view.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/comments_list_view.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/place_general_info.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/rating_form.dart';

class PlaceDetailsViewBody extends StatelessWidget {
  const PlaceDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(
            images: [
              Assets.imagesTest,
              Assets.imagesAzemPalace,
              Assets.imagesIdlib,
              Assets.imagesRasafe,
            ],
            title: "باب شرقي",
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
          SliverToBoxAdapter(child: PlaceGeneralInfo()),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
          SliverToBoxAdapter(
            child: CustomDescription(
              desc:
                  ' باب شرقي هو أحد أبواب المدينة القديمة في دمشق، وهو يقع في الجدار الشرقي للسور الدمشقي التاريخي. يُعد باب شرقي من أهم أبواب دمشق القديمة وأقدمها، ويعود تاريخه إلى العهد الروماني ثم أعيد بناؤه وتطويره في العصور الإسلامية المختلفة.يتميز الباب بموقعه الحيوي حيث يؤدي إلى منطقة الصالحية والخضراء، وكان يعتبر مدخلًا رئيسيًا للحجاج والتجار القادمين من الشرق. كما أنه يحتفظ بطابع معماري تقليدي يعكس التراث الدمشقي.',
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
          SliverToBoxAdapter(
            child: CustomMap(latitude: 33.5138, longitude: 36.2765),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
          SliverToBoxAdapter(
            child: CustomSection(
              title: "التقييمات و التعليقات",
              hasSeeAll: true,
              seaAllAction:
                  () => GoRouter.of(
                    context,
                  ).pushNamed(AppRouter.kAllCommentsAndRatingName),
              section: CommentsListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
          SliverToBoxAdapter(
            child: CustomSection(
              title: "تقييم المكان",
              hasSeeAll: false,
              seaAllAction: () {},
              section: RatingForm(),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
          SliverToBoxAdapter(
            child: CustomSection(
              section: PlacesCardsHorListView(),
              title: "الأماكن المشابهة",
              hasSeeAll: true,
              seaAllAction:
                  () => GoRouter.of(context).pushNamed(
                    AppRouter.kAllPlacesName,
                    extra: "الأماكن المشابهة",
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
