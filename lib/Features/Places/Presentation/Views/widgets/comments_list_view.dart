import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/custom_comment.dart';

class CommentsListView extends StatelessWidget {
  const CommentsListView({
    super.key,
    this.physics = const BouncingScrollPhysics(),
    this.shrinkWrap = false,
  });

  final ScrollPhysics physics;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return shrinkWrap
        ? ListView.separated(
          itemBuilder: (context, index) => CustomComment(),
          separatorBuilder:
              (context, index) => SizedBox(height: AppSpacing.s12),
          itemCount: 3,
          physics: physics,
          padding: EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: shrinkWrap,
        )
        : SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList.separated(
            itemBuilder: (context, index) => CustomComment(),
            separatorBuilder:
                (context, index) => SizedBox(height: AppSpacing.s12),
            itemCount: 3,
          ),
        );
  }
}
