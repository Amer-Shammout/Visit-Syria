import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/auth_views_header.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/or_buttons.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/or_indicator.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Forget%20Password/forget_password_form_1.dart';

class ForgetPasswordBody1 extends StatelessWidget {
  const ForgetPasswordBody1({super.key});

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
                title: 'هل نسيت كلمة المرور؟',
                subTitle:
                    'أدخل بريدك الإلكتوني المرتبط بحسابك،  وسنرسل لك رمز التحقق لإعادة تعيين كلمة المرور.',
              ),
              const SizedBox(height: AppSpacing.s32),
              ForgetPasswordForm1(),
              SizedBox(height: AppSpacing.s16),
              OrIndicaor(),

              const SizedBox(height: AppSpacing.s24),
              OrButtons(),
              const SizedBox(height: AppSpacing.s16),
            ],
          ),
        ),
      ),
    );
  }
}
