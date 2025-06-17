import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.isSelected,
    required this.onOptionToggle,
    required this.option,
  });

  final bool isSelected;
  final String option;
  final Function(String p1) onOptionToggle;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: isSelected ? Colors.transparent : AppColors.primary,
        ),
      ),
      label: Text(option),
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
