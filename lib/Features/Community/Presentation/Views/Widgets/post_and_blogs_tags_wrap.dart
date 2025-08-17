import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_and_blog_tag.dart';

class PostandBlogsTagsWrap extends StatelessWidget {
  const PostandBlogsTagsWrap({super.key, required this.tags, this.textStyle});

  final List<dynamic> tags;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      // direction: Axis.horizontal,
      children:
          tags.map((tag) {
            return FittedBox(
              child: PostandBlogTag(tag: tag, textStyle: textStyle),
            );
          }).toList(),
    );
  }
}
