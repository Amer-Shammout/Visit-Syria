import 'package:flutter/material.dart';

class SavedPostsViewBody extends StatelessWidget {
  const SavedPostsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      // slivers: [PostsListView()],
    );
  }
}
