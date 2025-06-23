import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Core/widgets/custom_map.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Core/widgets/custom_sliver_app_bar.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/comments_list_view.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/rating_form.dart';
import 'package:visit_syria/Features/Resturants%20&%20Hotels/Presentation/Views/widgets/custom_contact_floating_action_button.dart';
import 'package:visit_syria/Features/Resturants%20&%20Hotels/Presentation/Views/widgets/hotels_and_resturants_hor_list_view.dart';
import 'package:visit_syria/Features/Resturants%20&%20Hotels/Presentation/Views/widgets/resturants_and_hotels_general_info.dart';

class HotelAndResturantsDetailsViewBody extends StatelessWidget {
  const HotelAndResturantsDetailsViewBody({
    super.key,
    required this.isResturant,
  });

  final bool isResturant;

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
                title: "مطعم نانرج",
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
              SliverToBoxAdapter(child: ResturantsAndHotelsGeneralInfo()),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(
                child: CustomDescription(
                  desc:
                      ' مطعم أم شريف في دمشق معروف بجوه العائلي الدافئ وأطباقه السورية التقليدية الأصيلة. يتميز المطعم بتقديم مأكولات مثل المشاوي، الفروج المشوي، الكبة بأنواعها، والفتوش والتبولة الطازجة. الأسعار معقولة والخدمة لطيفة، مما يجعله مكانًا مفضلًا للعائلات والأصدقاء الذين يرغبون بتجربة الأطعمة السورية الأصيلة في أجواء مريحة وحميمة داخل العاصمة. إذا تحب الأكلات السورية التقليدية بنكهات بيتيّة، مطعم أم شريف خيار رائع.',
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
                  section: HotelAndResturantsHorListView(),
                  title: isResturant ? "المطاعم المشابهة" : "الفنادق المشابهة",
                  hasSeeAll: true,
                  seaAllAction:
                      () => GoRouter.of(context).pushNamed(
                        AppRouter.kSimialarHotelsOrResturantsName,
                        extra:
                            isResturant
                                ? "المطاعم المشابهة"
                                : "الفنادق المشابهة",
                      ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: CustomContactFloatingActionButton(),
          ),
        ],
      ),
    );
  }
}
