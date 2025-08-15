import 'package:flutter/material.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Models/article_model.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/Widgets/blog_details_view_body.dart';

class BlogDetailsView extends StatelessWidget {
  const BlogDetailsView({super.key, this.articleModel});

  final ArticleModel? articleModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlogDetailsViewBody(articleModel: articleModel));
  }
}
