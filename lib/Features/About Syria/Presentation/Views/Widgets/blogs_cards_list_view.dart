import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/scale_on_tap.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/Widgets/blogs_card.dart';

class BlogsCardsListView extends StatelessWidget {
  const BlogsCardsListView({super.key, this.articles, this.action});

  final List<dynamic>? articles;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
      sliver: SliverList.separated(
        itemBuilder:
            (context, index) => ScaleOnTap(
              onTap:
                  () => GoRouter.of(context).pushNamed(
                    AppRouter.kBlogDetailsName,
                    extra: articles?[index],
                  ),
              child: BlogsCard(articleModel: articles?[index], action: action),
            ),
        separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s16),
        itemCount: articles?.length ?? 6,
      ),
    );
  }
}
