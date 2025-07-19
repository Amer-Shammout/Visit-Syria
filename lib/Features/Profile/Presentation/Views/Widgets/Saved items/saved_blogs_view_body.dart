import 'package:flutter/material.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/Widgets/blogs_cards_list_view.dart';

class SavedBlogsViewBody extends StatelessWidget {
  const SavedBlogsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      slivers: [
        BlogsCardsListView()
      ],
    );
  }
}