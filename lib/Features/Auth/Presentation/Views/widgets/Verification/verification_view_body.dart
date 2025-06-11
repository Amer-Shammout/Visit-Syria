import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/auth_views_header.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Verification/verification_form.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(height: AppSpacing.s32),
              AuthViewsHeader(
                canPop: true,
                title: 'التحقق من الرمز',
                subTitle: 'لقد أرسلنا رمز التحقق إلى بريدك الإلكتروني\nيرجى إدخال الرمز لإكمال العملية بنجاح',
              ),
              SizedBox(height: AppSpacing.s32),
              VerificationForm(),
            ],
          ),
        ),
      ),
    );
  }
}
