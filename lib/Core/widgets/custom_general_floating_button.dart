import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';

class CustomGeneralFloatingButton extends StatelessWidget {
  const CustomGeneralFloatingButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [Shadows.aiBootContainerShadow],
        color: AppColors.whiteColor,
      ),
      child: CustomButton(
        onPressed: onPressed,
        title: title,
        textStyle: AppStyles.fontsBold14(
          context,
        ).copyWith(color: AppColors.whiteColor),
        borderRadius: 16,
        verPadding: 12,
        icon: Assets.iconsArrow,
        iconColor: AppColors.whiteColor,
        size: 16,
      ),
    );
  }
}
