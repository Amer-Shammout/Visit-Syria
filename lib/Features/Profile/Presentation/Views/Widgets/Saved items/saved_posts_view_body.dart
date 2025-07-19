import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/posts_list_view.dart';

class SavedPostsViewBody extends StatelessWidget {
  const SavedPostsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      slivers: [
        PostsListView()
      ],
    );
  }
}