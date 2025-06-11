import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/auth_views_header.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Forget%20Password/forget_password_form_2.dart';

class ForgetPasswordBody2 extends StatelessWidget {
  const ForgetPasswordBody2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView (
          child: Column(
            children: const [
              SizedBox(height: AppSpacing.s32),
              AuthViewsHeader(
                canPop: true,
                title: 'أدخل رمز التحقق',
                subTitle: 'تحقق من بريدك الإلكتروني وأدخل رمز التحقق لمتابعة عملية إعادة تعيين كلمة المرور.',
              ),
              SizedBox(height: AppSpacing.s32),
              ForgetPasswordForm2(),
            ],
          ),
        ),
      ),
    );
  }
}