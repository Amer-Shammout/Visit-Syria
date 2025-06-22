import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Core/widgets/custom_sliver_app_bar.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/Widgets/similar_blogs_cards_list_view.dart';

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
              seaAllAction:
                  () => GoRouter.of(
                    context,
                  ).pushNamed(AppRouter.kSimilarBlogsName),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}
