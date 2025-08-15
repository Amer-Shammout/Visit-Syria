import 'package:flutter/material.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Models/article_model.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/Widgets/blogs_cards_list_view.dart';

class AllSimilarBlogsViewBody extends StatelessWidget {
  const AllSimilarBlogsViewBody({super.key, this.articles});
  final List<ArticleModel>? articles;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [BlogsCardsListView(articles: articles)],
    );
  }
}
