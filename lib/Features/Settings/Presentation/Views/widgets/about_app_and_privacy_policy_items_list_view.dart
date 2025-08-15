import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Settings/Data/Models/settings_model.dart';
import 'package:visit_syria/Features/Settings/Presentation/Views/widgets/about_app_and_privacy_policy_item.dart';

class AboutAppAndPrivacyPolicyItemsListView extends StatelessWidget {
  const AboutAppAndPrivacyPolicyItemsListView({
    super.key,
    required this.settings,
  });

  final List<SettingsModel> settings;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:
          (context, index) =>
              AboutAppAndPrivacyPolicyItem(settingsModel: settings[index]),
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s32),
      itemCount: settings.length,
      clipBehavior: Clip.none,
      physics: BouncingScrollPhysics(),
    );
  }
}
