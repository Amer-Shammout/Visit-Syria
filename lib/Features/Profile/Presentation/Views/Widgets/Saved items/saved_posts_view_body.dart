import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Saved%20items/saved_posts_list_view_builder.dart';

class SavedPostsViewBody extends StatelessWidget {
  const SavedPostsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      slivers: [SavedPostsListViewBuilder()],
    );
  }
}
