import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class OrIndicaor extends StatelessWidget {
  const OrIndicaor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.graySwatch[500])),
        SizedBox(width: AppSpacing.s16),
        Text(
          "أو",
          style: AppStyles.fontsRegular14(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
        SizedBox(width: AppSpacing.s16),
        Expanded(child: Divider(color: AppColors.graySwatch[500])),
      ],
    );
  }
}
