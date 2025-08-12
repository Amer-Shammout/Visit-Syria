import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/auth_views_header.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/or_buttons.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/or_indicator.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Login/login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
                title: 'أهلًا بك',
                subTitle:
                    'ادخل إلى عالمك السياحي الخاص، و تابع رحلاتك، حجوزاتك، و تجاربك بكل سهولة و أمان.',
              ),
              const SizedBox(height: AppSpacing.s32),
              LoginForm(),
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
