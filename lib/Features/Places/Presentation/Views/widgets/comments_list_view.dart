import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/recent_comment.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/custom_comment.dart';

class CommentsListView extends StatelessWidget {
  const CommentsListView({
    super.key,
    this.physics = const BouncingScrollPhysics(),
    this.shrinkWrap = false,
    this.hasRate,
    this.comments,
  });

  final ScrollPhysics physics;
  final bool shrinkWrap;
  final bool? hasRate;
  final List<RecentComment>? comments;

  @override
  Widget build(BuildContext context) {
    return shrinkWrap
        ? ListView.separated(
          itemBuilder:
              (context, index) => CustomComment(comment: comments?[index]),
          separatorBuilder:
              (context, index) => SizedBox(height: AppSpacing.s12),
          itemCount: comments!.length > 3 ? 3 : comments!.length,
          physics: physics,
          padding: EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: shrinkWrap,
        )
        : SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList.separated(
            itemBuilder:
                (context, index) => CustomComment(
                  hasRate: hasRate ?? true,
                  comment: comments?[index],
                ),
            separatorBuilder:
                (context, index) => SizedBox(height: AppSpacing.s12),
            itemCount: comments?.length ?? 10,
          ),
        );
  }
}
