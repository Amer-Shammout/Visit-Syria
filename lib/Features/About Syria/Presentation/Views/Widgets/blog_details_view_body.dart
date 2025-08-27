import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Core/widgets/custom_sliver_app_bar.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Models/article_model.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Manager/get_similar_articles_by_id_cubit/get_similar_articles_by_id_cubit.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/Widgets/similar_blogs_cards_list_view_builder.dart';

class BlogDetailsViewBody extends StatefulWidget {
  const BlogDetailsViewBody({super.key, this.articleModel});

  final ArticleModel? articleModel;

  @override
  State<BlogDetailsViewBody> createState() => _BlogDetailsViewBodyState();
}

class _BlogDetailsViewBodyState extends State<BlogDetailsViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetSimilarArticlesByIdCubit>(
      context,
    ).fetchSimilarArticles(widget.articleModel!.id!.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(
            model: widget.articleModel,
            type: "article",
            id: widget.articleModel!.id.toString(),
            isSaved: widget.articleModel!.isSaved!,
            images: [Assets.imagesDaraa],
            title:
                widget.articleModel?.title ??
                "دمشق: أقدم مدينة مأهولة في التاريخ",
            hasRate: false,
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
          SliverToBoxAdapter(
            child: CustomDescription(
              desc:
                  widget.articleModel?.body ??
                  'الدبكة السورية هي أكثر من مجرد رقصة شعبية؛ إنها تعبير جماعي عن الفرح والانتماء. تُؤدى في الأعراس والمناسبات الشعبية، حيث يصطف الراقصون جنباً إلى جنب، يمسكون بأيدي بعضهم البعض، ويخطون بخطى منتظمة على إيقاع الطبل والمزمار. تعكس هذه الرقصة روح التعاون والتلاحم المجتمعي، وتُعد رمزاً حياً للهوية الثقافية السورية.',
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),

          SliverToBoxAdapter(
            child: CustomSection(
              section: SimilarBlogsCardListViewBuilder(
                id: widget.articleModel!.id!.toString(),
              ),
              title: "مقالات المشابهة",
              hasSeeAll: GetSimilarArticlesByIdCubit.similarArticles.isNotEmpty,
              seaAllAction:
                  () => GoRouter.of(context).pushNamed(
                    AppRouter.kSimilarBlogsName,
                    extra: GetSimilarArticlesByIdCubit.similarArticles,
                  ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}
