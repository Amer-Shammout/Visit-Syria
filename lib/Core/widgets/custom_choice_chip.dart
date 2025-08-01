import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.isSelected,
    required this.onOptionToggle,
    required this.option,
    this.icon,
  });

  final bool isSelected;
  final String option;
  final Function(String p1) onOptionToggle;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: isSelected ? Colors.transparent : AppColors.primary,
        ),
      ),
      label: Row(
        children: [
          icon != null
              ? SvgPicture.asset(
                icon!,
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.whiteColor : AppColors.primary,
                  BlendMode.srcATop,
                ),
              )
              : SizedBox.shrink(),
          icon != null ? SizedBox(width: AppSpacing.s4) : SizedBox.shrink(),
          Text(option),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      showCheckmark: false,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      disabledColor: Colors.transparent,
      selected: isSelected,
      onSelected: (_) => onOptionToggle(option),
      selectedColor: AppColors.primary,
      backgroundColor: AppColors.whiteColor,
      labelStyle: AppStyles.fontsBold14(
        context,
      ).copyWith(color: isSelected ? AppColors.whiteColor : AppColors.primary),
    );
  }
}
