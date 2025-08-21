import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Community/Data/Models/post_model/post_model.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_card.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({
    super.key,
    required this.posts,
    required this.displayStatus,
    this.isMyPost = false,
  });

  final List<PostModel> posts;
  final bool displayStatus;
  final bool isMyPost;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
      sliver: SliverList.separated(
        itemBuilder:
            (context, index) => PostCard(
              hasImage: posts[index].image != null,
              postModel: posts[index],
              displayStatus: displayStatus,
              isMyPost: isMyPost,
            ),
        separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s16),
        itemCount: posts.length,
      ),
    );
  }
}
