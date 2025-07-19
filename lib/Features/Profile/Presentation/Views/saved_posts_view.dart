import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Saved%20items/saved_posts_view_body.dart';

class SavedPostsView extends StatelessWidget {
  const SavedPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(hasTitle: true,title: "المنشورات المحفوظة",),
      body: SavedPostsViewBody(),
    );
  }
}