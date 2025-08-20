import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_dialog.dart';

class CustomConfirmDialog extends StatelessWidget {
  const CustomConfirmDialog({
    super.key,
    required this.onPressed,
    this.confirmColor,
    required this.text,
    this.confirmTitle,
  });
  final void Function() onPressed;
  final Color? confirmColor;
  final String text;
  final String? confirmTitle;
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      useHeader: false,
      child: Column(
        children: [
          Text(
            text,
            style: AppStyles.fontsBold16(
              context,
            ).copyWith(color: AppColors.titleTextColor),
          ),
          SizedBox(height: AppSpacing.s20),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onPressed: onPressed,
                  title: confirmTitle ?? "تأكيد",
                  textStyle: AppStyles.fontsBold14(
                    context,
                  ).copyWith(color: AppColors.whiteColor),
                  borderRadius: 16,
                  verPadding: 12,
                  icon: Assets.iconsArrow,
                  iconColor: AppColors.whiteColor,
                  size: 16,
                  fillColor: confirmColor ?? AppColors.red,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: CustomButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  title: "تراجع",
                  textStyle: AppStyles.fontsBold14(
                    context,
                  ).copyWith(color: AppColors.primary),
                  borderRadius: 16,
                  verPadding: 12,

                  iconColor: AppColors.primary,
                  size: 16,
                  fillColor: AppColors.whiteColor,
                  strokeColor: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
