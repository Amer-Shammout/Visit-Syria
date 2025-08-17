import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_counter.dart';

class CustomCounterStatement extends StatelessWidget {
  const CustomCounterStatement({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.min,
    required this.max,
    required this.size,
    required this.onIncrement,
    required this.onDecrement,
  });

  final String title;
  final String? subtitle;
  final int value;
  final int min;
  final int? max;
  final double size;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyles.fontsRegular16(
                context,
              ).copyWith(color: AppColors.titleTextColor),
            ),
            SizedBox(height: AppSpacing.s2),
            subtitle != null
                ? Text(
                  subtitle!,
                  style: AppStyles.fontsLight12(
                    context,
                    12,
                  ).copyWith(color: AppColors.bodyTextColor),
                )
                : SizedBox.shrink(),
          ],
        ),
        CustomCounter(
          value: value,
          min: min,
          max: max,
          size: size,
          onIncrement: onIncrement,
          onDecrement: onDecrement,
        ),
      ],
    );
  }
}
