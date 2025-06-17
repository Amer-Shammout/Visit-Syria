import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/On%20Boarding/dots_indicator.dart';

class OnboardingBottomSheet extends StatelessWidget {
  final String title;
  final String description;
  final int currentPage;
  final int totalPages;
  final VoidCallback onNext;
  final bool isLastPage;

  const OnboardingBottomSheet({
    required this.title,
    required this.description,
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
    super.key,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: Alignment.bottomCenter,
          child: Container(
            color: const Color(0xffFBFEFD).withValues(alpha: 0.05),
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppStyles.fontsBold32(
                    context,
                  ).copyWith(color: AppColors.whiteColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.s24),
                Text(
                  description,
                  style: AppStyles.fontsRegular14(
                    context,
                  ).copyWith(color: AppColors.whiteColor.withValues(alpha: .3)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.s24),
                DotsIndicator(currentIndex: currentPage, totalDots: totalPages),
                const SizedBox(height: AppSpacing.s32),
                CustomButton(
                  icon: Assets.iconsArrow,
                  iconColor: AppColors.whiteColor,
                  width: double.infinity,
                  verPadding: 16,
                  onPressed: onNext,
                  title: isLastPage ? "ابدأ رحلتك الآن" : "التالي",
                  textStyle: AppStyles.fontsBold20(
                    context,
                  ).copyWith(color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
