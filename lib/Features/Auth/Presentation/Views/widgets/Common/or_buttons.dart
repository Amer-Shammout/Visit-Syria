import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/widgets/custom_button.dart';
import 'package:visit_syria/Core/utils/widgets/custom_text_button.dart';

class OrButtons extends StatelessWidget {
  const OrButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          shadow: null,
          onPressed: () {},
          title: 'تسجيل الدخول عبر غوغل',
          textStyle: AppStyles.fontsBold14(
            context,
          ).copyWith(color: AppColors.primary),
          borderRadius: 16,
          fillColor: Colors.transparent,
          strokeColor: AppColors.primary,
          verPadding: 16,
          icon: Assets.iconsGoogleIcon,
        ),
        const SizedBox(height: AppSpacing.s8),
        CustomTextButtonWithIcon(
          title: 'تسجيل الدخول كضيف',
          icon: Assets.iconsUser,
          style: AppStyles.fontsRegular14(context),
          color: AppColors.graySwatch[700]!,
          onPressed: () {},
          size: 16,
        ),
      ],
    );
  }
}