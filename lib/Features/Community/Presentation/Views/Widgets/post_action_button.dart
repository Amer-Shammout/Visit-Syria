import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class PostActionButton extends StatelessWidget {
  const PostActionButton({
    super.key,
    required this.inActiveIcon,
    this.activeIcon,
    this.isSelected = false,
    required this.text,
    required this.onTap,
  });

  final String inActiveIcon;
  final String? activeIcon;
  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        highlightColor: AppColors.primarySwatch[900]?.withValues(alpha: .1),
        onTap: onTap,
        child: Ink(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.graySwatch[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: SvgPicture.asset(
                  isSelected ? activeIcon! : inActiveIcon,
                  key: ValueKey<bool>(isSelected),
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(
                    isSelected ? AppColors.primary : AppColors.bodyTextColor,
                    BlendMode.srcATop,
                  ),
                ),
              ),
              SizedBox(width: AppSpacing.s4),
              Text(
                text,
                style: AppStyles.fontsRegular12(
                  context,
                ).copyWith(color: AppColors.bodyTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
