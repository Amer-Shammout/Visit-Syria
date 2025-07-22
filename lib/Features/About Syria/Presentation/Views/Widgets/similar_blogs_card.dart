import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/widgets/custom_icon_button.dart';
import 'package:visit_syria/Core/widgets/custom_image.dart';

class SimilarBlogsCard extends StatelessWidget {
  const SimilarBlogsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: AspectRatio(
        aspectRatio: 170 / 220,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomImage(
              height: 220,
              borderRadius: 24,
              image: Assets.imagesDaraa,
            ),
            PositionedDirectional(
              end: 12,
              top: 12,
              child: CustomIconButton(
                inActiveIcon: Assets.iconsBookmarkStroke,
                onTap: () {},
                isActive: false,
                activeIcon: Assets.iconsBookmarkFill,
              ),
            ),
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Text(
                "دمشق: أقدم مدينة مأهولة في التاريخ",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.fontsBold20(
                  context,
                ).copyWith(color: AppColors.whiteColor),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
