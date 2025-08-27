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
      blur: 40,
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
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(scale: animation, child: child),
                );
              },
              child: SvgPicture.asset(
                isActive ? activeIcon! : inActiveIcon,
                key: ValueKey<bool>(isActive), // مهم للتمييز بين الحالات
                height: isSmall ? 12 : 16,
                width: isSmall ? 12 : 16,
                colorFilter: const ColorFilter.mode(
                  AppColors.whiteColor,
                  BlendMode.srcATop,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
