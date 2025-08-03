import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/widgets/image_selector.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.title,
    required this.images,
    this.hasActionButton = true,
  });

  final String title;
  final List<String> images;
  final bool hasActionButton;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight:
          images.length < 2
              ? 360
              : 360 + (MediaQuery.sizeOf(context).width - 56) / 4 + 16,
      pinned: true,
      floating: false,
      backgroundColor: AppColors.whiteColor,
      automaticallyImplyLeading: false,
      surfaceTintColor: AppColors.whiteColor,
      toolbarHeight: 0,

      flexibleSpace: FlexibleSpaceBar(
        background: ImageSelector(
          title: title,
          images: images,
          hasActionButton: hasActionButton,
        ),
      ),
    );
  }
}
