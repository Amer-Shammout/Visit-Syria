import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/comment_bottom_sheet.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/comments_list_view.dart';

class AllCommentsView extends StatelessWidget {
  const AllCommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "كل التعليقات"),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [CommentsListView(hasRate: false, shrinkWrap: false)],
      ),
      bottomSheet: CommentBottomSheet(),
    );
  }
}
