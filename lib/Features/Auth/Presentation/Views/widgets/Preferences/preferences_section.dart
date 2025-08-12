import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_choice_chip.dart';

class PreferencesSection extends StatelessWidget {
  final String title;
  final List<dynamic> options;
  final List<dynamic> selectedOptions;
  final Function(dynamic) onOptionToggle;

  const PreferencesSection({
    required this.title,
    required this.options,
    required this.selectedOptions,
    required this.onOptionToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.fontsBold16(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
        const SizedBox(height: AppSpacing.s8),
        Wrap(
          spacing: 12,
          runSpacing: 4,
          children:
              options.map((option) {
                final isSelected = selectedOptions.contains(option);
                return CustomChoiceChip(
                  isSelected: isSelected,
                  onOptionToggle: onOptionToggle,
                  option: option,
                );
              }).toList(),
        ),
      ],
    );
  }
}
