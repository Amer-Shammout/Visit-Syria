import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/widgets/glass_effect.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.inActiveIcon,
    this.activeIcon,
    required this.onTap,
    required this.isActive,
    this.isSmall = false,
  });

  final String inActiveIcon;
  final String? activeIcon;
  final VoidCallback onTap;
  final bool isActive;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return GlassEffect(
      radius: 360,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding: EdgeInsets.all(isSmall ? 8 : 12),
          width: isSmall ? 28 : 40,
          height: isSmall ? 28 : 40,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: .2),
            shape: BoxShape.circle,
          ),
          child: Transform.flip(
            flipX: true,
            child: SvgPicture.asset(
              isActive ? activeIcon! : inActiveIcon,
              height: isSmall ? 12 : 16,
              width: isSmall ? 12 : 16,
              colorFilter: ColorFilter.mode(
                AppColors.whiteColor,
                BlendMode.srcATop,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
