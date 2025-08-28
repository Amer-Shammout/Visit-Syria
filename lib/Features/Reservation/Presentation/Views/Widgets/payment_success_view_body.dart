import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/constants/text_constant.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';

class PaymentSuccessViewBody extends StatelessWidget {
  const PaymentSuccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.illustrationsSuccessPayment),
            SizedBox(height: AppSpacing.s64),
            CustomSection(
              crossAxisAlignment: CrossAxisAlignment.center,
              title: kPaymentSuccessTitle,
              hasSeeAll: false,
              section: Text(
                kPaymentSuccessDescription,
                style: AppStyles.fontsRegular14(
                  context,
                ).copyWith(color: AppColors.bodyTextColor),
              ),
            ),
            SizedBox(height: AppSpacing.s64),
            CustomButton(
              borderRadius: 12,
              width: double.infinity,
              onPressed: () {
                GoRouter.of(context).goNamed(AppRouter.kAppRootName);
              },
              title: 'تم',
              textStyle: AppStyles.fontsBold16(
                context,
              ).copyWith(color: AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
