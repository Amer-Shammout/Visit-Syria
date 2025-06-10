import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Core/utils/widgets/custom_icon_button.dart';
import 'package:visit_syria/Core/utils/widgets/custom_image.dart';

class OffersCardImage extends StatelessWidget {
  const OffersCardImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImage(height: 150, borderRadius: 20),
        Positioned(
          left: 8,
          right: 8,
          top: 8,
          bottom: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OffersTag(),
                  CustomIconButton(
                    inActiveIcon: Assets.iconsBookmarkStroke,
                    onTap: () {},
                    isActive: false,
                    activeIcon: Assets.iconsBookmarkFill,
                  ),
                ],
              ),
              Text(
                ' رحلة إلى سواحل سوريا',
                style: AppStyles.fontsBold16(
                  context,
                ).copyWith(color: AppColors.whiteColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OffersTag extends StatelessWidget {
  const OffersTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [Shadows.shadow],
        color: AppColors.red,
      ),
      child: Text(
        "50%",
        style: AppStyles.fontsBold12(
          context,
        ).copyWith(color: AppColors.whiteColor),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}

