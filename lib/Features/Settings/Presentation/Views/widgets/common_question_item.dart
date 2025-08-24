import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/widgets/custom_expanstion_tile.dart';
import 'package:visit_syria/Features/Settings/Data/Models/settings_model.dart';

class CommonQuestionsItem extends StatelessWidget {
  final SettingsModel settingsModel;

  const CommonQuestionsItem({super.key, required this.settingsModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomExpansionTile(
        title: settingsModel.title!,
        icon: Assets.iconsAbout,
        children: [
          Text(
            settingsModel.description!,
            style: AppStyles.fontsRegular14(
              context,
            ).copyWith(color: AppColors.bodyTextColor),
          ),
        ],
      ),
    );
  }
}
