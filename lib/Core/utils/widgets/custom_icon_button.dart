import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/widgets/glass_effect.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.inActiveIcon,
    this.activeIcon,
    required this.onTap,
    required this.isActive,
  });

  final String inActiveIcon;
  final String? activeIcon;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GlassEffect(
      radius: 360,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding: EdgeInsets.all(12),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: .2),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            isActive ? activeIcon! : inActiveIcon,
            height: 16,
            width: 16,
            colorFilter: ColorFilter.mode(
              AppColors.whiteColor,
              BlendMode.srcATop,
            ),
          ),
        ),
      ),
    );
  }
}