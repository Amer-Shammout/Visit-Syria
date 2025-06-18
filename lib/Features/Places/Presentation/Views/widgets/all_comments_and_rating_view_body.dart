import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/comments_list_view.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';

class AllCommentsAndRatingViewBody extends StatelessWidget {
  const AllCommentsAndRatingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        PinnedHeaderSliver(
          child: Container(
            color: AppColors.whiteColor,
            child: TagsListView(
              data: [
                "كل التعليقات",
                "التعليقات الايجابية",
                "التعليقات السلبية",
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s12)),
        CommentsListView(shrinkWrap: false),
        SliverToBoxAdapter(child: SizedBox(height: 270)),
      ],
    );
  }
}
