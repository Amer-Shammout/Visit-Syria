import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/widgets/custom_icon_button.dart';
import 'package:visit_syria/Core/widgets/custom_image.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/offers_tag.dart';

class TripsCardImage extends StatelessWidget {
  const TripsCardImage({super.key, required this.imageHeight, required this.positionedVal});

  final double imageHeight;
  final double positionedVal;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImage(height: imageHeight, borderRadius: 20),
        Positioned(
          left: positionedVal,
          right: positionedVal,
          top: positionedVal,
          bottom: positionedVal,
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
