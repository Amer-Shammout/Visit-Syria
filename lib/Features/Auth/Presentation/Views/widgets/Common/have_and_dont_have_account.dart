import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_text_button.dart';

class HaveandDontHaveAccount extends StatelessWidget {
  const HaveandDontHaveAccount({
    super.key,
    required this.statement,
    required this.actionStatement,
    required this.onPressed,
  });

  final String statement;
  final String actionStatement;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          statement,
          style: AppStyles.fontsRegular14(
            context,
          ).copyWith(color: AppColors.bodyTextColor),
        ),
        SizedBox(width: AppSpacing.s4),
        CustomTextButton(
          onPressed: onPressed,
          title: actionStatement,
          textStyle: AppStyles.fontsBold14(
            context,
          ).copyWith(color: AppColors.primary),
        ),
      ],
    );
  }
}
