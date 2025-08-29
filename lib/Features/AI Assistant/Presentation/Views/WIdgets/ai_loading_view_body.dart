import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';

class AILoadingViewBody extends StatelessWidget {
  const AILoadingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(Assets.lottieAILoading),
            SizedBox(height: AppSpacing.s64),
            CustomSection(
              title: 'جار إعداد رحلتك...',
              hasSeeAll: false,
              section: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'نجهز لك تجربة سياحية مخصصة بناءً على اختياراتك – فقط لحظات قليلة ونأخذك في مغامرة لا تُنسى!',
                  style: AppStyles.fontsRegular14(
                    context,
                  ).copyWith(color: AppColors.bodyTextColor),
                ),
              ),
            ),
            SizedBox(height: AppSpacing.s64),
          ],
        ),
      ),
    );
  }
}
