import 'package:flutter/material.dart';
import 'package:visit_syria/Core/data/models/comment_model/comment_model.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/recent_comment.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/custom_comment.dart';

class CommentsListView extends StatelessWidget {
  const CommentsListView({
    super.key,
    this.physics = const BouncingScrollPhysics(),
    this.shrinkWrap = false,
    this.hasRate,
    this.recentComments,
    this.comments,
  });

  final ScrollPhysics physics;
  final bool shrinkWrap;
  final bool? hasRate;
  final List<RecentComment>? recentComments;
  final List<CommentModel>? comments;

  @override
  Widget build(BuildContext context) {
    return !shrinkWrap
        ? SliverPadding(
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
        )
        : ListView.separated(
          itemBuilder:
              (context, index) =>
                  CustomComment(recentComment: recentComments?[index]),
          separatorBuilder:
              (context, index) => SizedBox(height: AppSpacing.s12),
          itemCount: recentComments!.length > 3 ? 3 : recentComments!.length,
          physics: physics,
          padding: EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: shrinkWrap,
        );
  }
}
