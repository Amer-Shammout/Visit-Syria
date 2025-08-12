import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback? onTap;
  // final double radius;
  // final double iconSize;

  const ProfileAvatar({
    super.key,
    this.imageUrl,
    this.onTap,
    // this.radius = 60,
    // this.iconSize = 48,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 6,
              color: AppColors.primarySwatch[950]!.withValues(alpha: .1),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 24,

          backgroundColor: AppColors.whiteColor,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
          child:
              imageUrl == null
                  ? SvgPicture.asset(
                    Assets.iconsUser,
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcATop,
                    ),
                  )
                  : null,
        ),
      ),
    );
  }
}
