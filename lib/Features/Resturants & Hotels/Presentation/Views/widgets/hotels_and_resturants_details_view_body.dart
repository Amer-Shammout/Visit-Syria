import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
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
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/rating_form.dart';
import 'package:visit_syria/Features/Resturants%20&%20Hotels/Presentation/Views/widgets/custom_contact_floating_action_button.dart';
import 'package:visit_syria/Features/Resturants%20&%20Hotels/Presentation/Views/widgets/resturants_and_hotels_general_info.dart';

class HotelAndResturantsDetailsViewBody extends StatelessWidget {
  const HotelAndResturantsDetailsViewBody({
    super.key,
    required this.isResturant,
    this.place,
  });

  final bool isResturant;
  final PlaceModel? place;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              CustomSliverAppBar(
                type: 'place',
                model: place,
                id: place!.id!.toString(),
                isSaved: place!.isSaved!,
                images: [
                  Assets.imagesTest,
                  Assets.imagesAzemPalace,
                  Assets.imagesIdlib,
                  Assets.imagesRasafe,
                ],
                title: place?.name ?? "مطعم نانرج",
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
              SliverToBoxAdapter(
                child: ResturantsAndHotelsGeneralInfo(place: place),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(
                child: CustomDescription(
                  desc:
                      place?.description ??
                      ' مطعم أم شريف في دمشق معروف بجوه العائلي الدافئ وأطباقه السورية التقليدية الأصيلة. يتميز المطعم بتقديم مأكولات مثل المشاوي، الفروج المشوي، الكبة بأنواعها، والفتوش والتبولة الطازجة. الأسعار معقولة والخدمة لطيفة، مما يجعله مكانًا مفضلًا للعائلات والأصدقاء الذين يرغبون بتجربة الأطعمة السورية الأصيلة في أجواء مريحة وحميمة داخل العاصمة. إذا تحب الأكلات السورية التقليدية بنكهات بيتيّة، مطعم أم شريف خيار رائع.',
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(
                child: CustomMap(
                  latitude: double.parse(place!.latitude!),
                  longitude: double.parse(place!.longitude!),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(
                child: CustomSection(
                  title: "التقييمات و التعليقات",
                  hasSeeAll: true,
                  seaAllAction:
                      () => GoRouter.of(context).pushNamed(
                        AppRouter.kAllCommentsAndRatingName,
                        extra: place,
                      ),
                  section:
                      place!.recentComments!.isNotEmpty
                          ? BlocBuilder<
                            AddCommentAndRatingCubit,
                            AddCommentAndRatingState
                          >(
                            builder: (context, state) {
                              return CommentsListView(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                hasRate: true,
                                recentComments: place?.recentComments,
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
              place?.userRating == "guest"
                  ? SliverToBoxAdapter(child: SizedBox.shrink())
                  : SliverToBoxAdapter(
                    child: CustomSection(
                      title: "تقييم المكان",
                      hasSeeAll: false,
                      seaAllAction: () {},
                      section: RatingForm(
                        userComment: place?.userComment,
                        userRate: place?.userRating,
                        recentComments: place?.recentComments,
                        id: place?.id,
                        placeModel: place,
                      ),
                    ),
                  ),
              place?.userRating == "guest"
                  ? SliverToBoxAdapter(child: SizedBox.shrink())
                  : SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),

              SliverToBoxAdapter(child: SizedBox(height: 64)),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: CustomContactFloatingActionButton(
              countryCode: place?.countryCode,
              phone: place?.phone,
            ),
          ),
        ],
      ),
    );
  }
}
