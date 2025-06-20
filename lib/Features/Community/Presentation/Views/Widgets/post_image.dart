import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';

class PostImage extends StatelessWidget {
  const PostImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 289,
      decoration: BoxDecoration(
        boxShadow: [Shadows.commonShadow],
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(Assets.imagesAzemPalace),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
