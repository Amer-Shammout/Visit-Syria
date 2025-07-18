import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_card.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({super.key, this.state});

  final String? state;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
      sliver: SliverList.separated(
        itemBuilder:
            (context, index) => PostCard(hasImage: index.isEven ? false : true,state: state,),
        separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s16),
        itemCount: 6,
      ),
    );
  }
}
