import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Auth/Data/Models/verification_model.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/auth_views_header.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Forget%20Password/forget_password_form_3.dart';

class ForgetPasswordBody3 extends StatelessWidget {
  const ForgetPasswordBody3({super.key, required this.verificationModel});

  final VerificationModel verificationModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: AppSpacing.s32),
              AuthViewsHeader(
                canPop: false,
                title: 'إعادة تعيين كلمةالمرور',
                subTitle:
                    'يرجى إدخال كلمة مرور جديدة لحسابك لتتمكن من تسجيل الدخول مجدداً ومتابعة استخدام خدماتنا بكل سهولة وأمان.',
              ),
              const SizedBox(height: AppSpacing.s32),
              ForgetPasswordForm3(verificationModel: verificationModel),

              const SizedBox(height: AppSpacing.s16),
            ],
          ),
        ),
      ),
    );
  }
}
