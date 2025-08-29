import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Core/widgets/custom_map.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Core/widgets/custom_sliver_app_bar.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';
import 'package:visit_syria/Features/Places/Presentation/Manager/add_comment_and_rating_cubit/add_comment_and_rating_cubit.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/comments_list_view.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/place_general_info.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/rating_form.dart';

class PlaceDetailsViewBody extends StatelessWidget {
  const PlaceDetailsViewBody({super.key, required this.place});

  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(
            model: place,
            type: 'place',
            id: place.id.toString(),
            isSaved: place.isSaved,
            images: place.images!,
            title: place.name != null ? place.name! : "باب شرقي",
            rate: place.rating,
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
          SliverToBoxAdapter(child: PlaceGeneralInfo(place: place)),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
          SliverToBoxAdapter(
            child: CustomDescription(
              desc:
                  place.description != null
                      ? place.description!
                      : ' باب شرقي هو أحد أبواب المدينة القديمة في دمشق، وهو يقع في الجدار الشرقي للسور الدمشقي التاريخي. يُعد باب شرقي من أهم أبواب دمشق القديمة وأقدمها، ويعود تاريخه إلى العهد الروماني ثم أعيد بناؤه وتطويره في العصور الإسلامية المختلفة.يتميز الباب بموقعه الحيوي حيث يؤدي إلى منطقة الصالحية والخضراء، وكان يعتبر مدخلًا رئيسيًا للحجاج والتجار القادمين من الشرق. كما أنه يحتفظ بطابع معماري تقليدي يعكس التراث الدمشقي.',
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
          SliverToBoxAdapter(
            child: CustomMap(
              latitude: double.parse(place.latitude!),
              longitude: double.parse(place.longitude!),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),

          SliverToBoxAdapter(
            child: CustomSection(
              title: "التقييمات و التعليقات",
              hasSeeAll: place.recentComments!.isNotEmpty,
              seaAllAction:
                  place.recentComments!.isNotEmpty
                      ? () => GoRouter.of(context).pushNamed(
                        AppRouter.kAllCommentsAndRatingName,
                        extra: place,
                      )
                      : null,
              section:
                  place.recentComments!.isNotEmpty
                      ? BlocBuilder<
                        AddCommentAndRatingCubit,
                        AddCommentAndRatingState
                      >(
                        builder: (context, state) {
                          return CommentsListView(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            hasRate: true,
                            recentComments: place.recentComments,
                          );
                        },
                      )
                      : Center(
                        child: Text(
                          "لا يوجد تعليقات حالياً",
                          style: AppStyles.fontsRegular14(
                            context,
                          ).copyWith(color: AppColors.titleTextColor),
                        ),
                      ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
          place.userRating == "guest"
              ? SliverToBoxAdapter(child: SizedBox.shrink())
              : SliverToBoxAdapter(
                child: CustomSection(
                  title: "تقييم المكان",
                  hasSeeAll: false,
                  seaAllAction: () {},
                  section: RatingForm(
                    userComment: place.userComment,
                    userRate: place.userRating,
                    recentComments: place.recentComments,
                    id: place.id,
                    placeModel: place,
                  ),
                ),
              ),
          place.userRating == "guest"
              ? SliverToBoxAdapter(child: SizedBox.shrink())
              : SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
        ],
      ),
    );
  }
}
