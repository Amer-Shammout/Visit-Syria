import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Saved%20items/saved_blogs_list_view_builder.dart';

class SavedBlogsViewBody extends StatelessWidget {
  const SavedBlogsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      slivers: [SavedBlogsListViewBuilder()],
    );
  }
}

