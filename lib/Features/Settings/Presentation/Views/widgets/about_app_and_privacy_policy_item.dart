import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Features/Settings/Data/Models/settings_model.dart';

class AboutAppAndPrivacyPolicyItem extends StatelessWidget {
  const AboutAppAndPrivacyPolicyItem({super.key, required this.settingsModel});

  final SettingsModel settingsModel;

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      haspoint: true,
      title: settingsModel.title!,
      hasSeeAll: false,
      section: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          settingsModel.description!,
          style: AppStyles.fontsRegular14(
            context,
          ).copyWith(color: AppColors.bodyTextColor),
        ),
      ),
    );
  }
}
