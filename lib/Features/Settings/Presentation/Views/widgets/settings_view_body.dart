import 'package:flutter/material.dart';
import 'package:visit_syria/Core/constants/settings_constants.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_tile.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:
          (context, index) =>
              CustomTile(tileModel: kSettingsItems[index], onTap: () {}),
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s12),
      itemCount: kSettingsItems.length,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
