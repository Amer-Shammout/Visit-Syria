import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/auth_views_header.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/or_buttons.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/or_indicator.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Forget%20Password/forget_password_form_1.dart';

class ForgetPasswordBody1 extends StatelessWidget {
  const ForgetPasswordBody1({super.key, required this.isChangePass});

  final bool isChangePass;

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
                canPop: true,
                title: 'هل نسيت كلمة المرور؟',
                subTitle:
                    'أدخل بريدك الإلكتوني المرتبط بحسابك،  وسنرسل لك رمز التحقق لإعادة تعيين كلمة المرور.',
              ),
              const SizedBox(height: AppSpacing.s32),
              ForgetPasswordForm1(isChangePass: isChangePass),
              isChangePass
                  ? SizedBox.shrink()
                  : SizedBox(height: AppSpacing.s16),
              isChangePass ? SizedBox.shrink() : OrIndicaor(),

              isChangePass
                  ? SizedBox.shrink()
                  : const SizedBox(height: AppSpacing.s24),
              isChangePass ? SizedBox.shrink() : OrButtons(),
              isChangePass
                  ? SizedBox.shrink()
                  : const SizedBox(height: AppSpacing.s16),
            ],
          ),
        ),
      ),
    );
  }
}
