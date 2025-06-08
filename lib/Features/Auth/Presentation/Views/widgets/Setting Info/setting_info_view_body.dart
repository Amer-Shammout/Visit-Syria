import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/auth_views_header.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Setting%20Info/setting_info_form.dart';

class SettingInfoViewBody extends StatelessWidget {
  const SettingInfoViewBody({super.key});

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
                title: 'أدخل معلوماتك الشخصية',
                subTitle:
                    'أكمل ملفك الشخصي بإضافة اسمك، بلدك، وصورتك الشخصية\nلنقدم لك تجربة سياحية مخصصة تناسب اهتماماتك و تفضيلاتك',
              ),
              SizedBox(height: AppSpacing.s24),
              SettingInfoForm(),
            ],
          ),
        ),
      ),
    );
  }
}
