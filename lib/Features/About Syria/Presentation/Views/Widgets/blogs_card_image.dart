import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_icon_button.dart';

class BlogsCardImage extends StatelessWidget {
  const BlogsCardImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox.expand(
            child: Image.asset(Assets.imagesDaraa, fit: BoxFit.cover),
          ),
        ),
        PositionedDirectional(
          start: 8,
          top: 8,
          child: CustomIconButton(
            inActiveIcon: Assets.iconsBookmarkStroke,
            onTap: () {},
            isActive: false,
            activeIcon: Assets.iconsBookmarkFill,
          ),
        ),
      ],
    );
  }
}
