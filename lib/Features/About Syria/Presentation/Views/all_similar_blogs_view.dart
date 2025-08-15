import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Models/article_model.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/Widgets/all_similar_blogs_view_body.dart';

class AllSimilarBlogsView extends StatelessWidget {
  const AllSimilarBlogsView({super.key, this.articles});

  final List<ArticleModel>? articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: 'المقالات المشابهة'),
      body: AllSimilarBlogsViewBody(articles: articles),
    );
  }
}
