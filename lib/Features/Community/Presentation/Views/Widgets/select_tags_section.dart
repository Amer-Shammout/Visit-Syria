import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/constants/tags_constants.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_choice_chip.dart';

class SelectTagsSection extends StatelessWidget {
  const SelectTagsSection({
    super.key,
    required this.selectedTags,
    required this.onOptionToggle,
  });

  final List<String> selectedTags;
  final Function(String) onOptionToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "أضف أوسمة",
              style: AppStyles.fontsBold22(
                context,
              ).copyWith(color: AppColors.titleTextColor),
            ),
            const SizedBox(width: AppSpacing.s4),
            Text(
              "(عشرة كحد أعلى)",
              style: AppStyles.fontsRegular16(
                context,
              ).copyWith(color: AppColors.titleTextColor),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.s16),
        Wrap(
          spacing: 12,
          runSpacing: 4,
          children:
              kTags.map((tag) {
                final isSelected = selectedTags.contains(tag);
                return CustomChoiceChip(
                  isSelected: isSelected,
                  onOptionToggle: onOptionToggle,
                  option: tag,
                );
              }).toList(),
        ),
      ],
    );
  }
}
