import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_tag.dart';

class PostTagsWrap extends StatelessWidget {
  const PostTagsWrap({super.key, required this.tags});

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children:
          tags.map((tag) {
            return PostTag(tag: tag);
          }).toList(),
    );
  }
}
