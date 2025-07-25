import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/Widgets/similar_blogs_card.dart';

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
