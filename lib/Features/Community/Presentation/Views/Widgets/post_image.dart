import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';

class PostImage extends StatelessWidget {
  const PostImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 289,
      decoration: BoxDecoration(
        boxShadow: [Shadows.commonShadow],
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            "https://example.com/images/daraa.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
