import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Core/widgets/custom_icon_button.dart';
import 'package:visit_syria/Core/widgets/custom_image.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Core/widgets/custom_sliver_app_bar.dart';

class BlogDetailsView extends StatelessWidget {
  const BlogDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlogDetailsViewBody());
  }
}

class BlogDetailsViewBody extends StatelessWidget {
  const BlogDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(
            images: [Assets.imagesDaraa],
            title: "دمشق: أقدم مدينة مأهولة في التاريخ",
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
          SliverToBoxAdapter(
            child: CustomDescription(
              desc:
                  'الدبكة السورية هي أكثر من مجرد رقصة شعبية؛ إنها تعبير جماعي عن الفرح والانتماء. تُؤدى في الأعراس والمناسبات الشعبية، حيث يصطف الراقصون جنباً إلى جنب، يمسكون بأيدي بعضهم البعض، ويخطون بخطى منتظمة على إيقاع الطبل والمزمار. تعكس هذه الرقصة روح التعاون والتلاحم المجتمعي، وتُعد رمزاً حياً للهوية الثقافية السورية.',
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),

          SliverToBoxAdapter(
            child: CustomSection(
              section: SimilarBlogsCardsListView(),
              title: "مقالات المشابهة",
              hasSeeAll: true,
              seaAllAction: () {},
              // GoRouter.of(
              //   context,
              // ).pushNamed(AppRouter.kAllEventsName),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}

class SimilarBlogsCard extends StatelessWidget {
  const SimilarBlogsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: AspectRatio(
        aspectRatio: 170 / 220,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomImage(
              height: 220,
              borderRadius: 24,
              image: Assets.imagesDaraa,
            ),
            PositionedDirectional(
              end: 12,
              top: 12,
              child: CustomIconButton(
                inActiveIcon: Assets.iconsBookmarkStroke,
                onTap: () {},
                isActive: false,
                activeIcon: Assets.iconsBookmarkFill,
              ),
            ),
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Text(
                "دمشق: أقدم مدينة مأهولة في التاريخ",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.fontsBold20(
                  context,
                ).copyWith(color: AppColors.whiteColor),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SimilarBlogsCardsListView extends StatelessWidget {
  const SimilarBlogsCardsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsetsDirectional.only(
                start: index == 0 ? 16 : 0,
                end: index == 5 ? 16 : 0,
              ),
              child: GestureDetector(
                onTap:
                    () => GoRouter.of(
                      context,
                    ).pushNamed(AppRouter.kBlogDetailsName),
                child: SimilarBlogsCard(),
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(width: AppSpacing.s16),
        itemCount: 6,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
