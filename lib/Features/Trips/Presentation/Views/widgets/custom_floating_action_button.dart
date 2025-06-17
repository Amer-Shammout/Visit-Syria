import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        boxShadow: [Shadows.aiBootContainerShadow],
        color: AppColors.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: CustomButton(
              onPressed: () {},
              title: "احجز الآن",
              textStyle: AppStyles.fontsBold14(
                context,
              ).copyWith(color: AppColors.whiteColor),
              borderRadius: 16,
              verPadding: 12,
              icon: Assets.iconsArrow,
              iconColor: AppColors.whiteColor,
              size: 16,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "السعر",
                      style: AppStyles.fontsRegular14(
                        context,
                      ).copyWith(color: AppColors.graySwatch[700]),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: AppSpacing.s4),
                    Text(
                      "450 SYP",
                      textDirection: TextDirection.ltr,
                      style: AppStyles.fontsBold20(
                        context,
                      ).copyWith(color: AppColors.titleTextColor),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
