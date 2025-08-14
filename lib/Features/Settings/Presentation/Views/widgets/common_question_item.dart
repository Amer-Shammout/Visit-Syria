import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Features/Settings/Data/Models/settings_model.dart';

class CommonQuestionsItem extends StatelessWidget {
  final SettingsModel settingsModel;

  const CommonQuestionsItem({super.key, required this.settingsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.graySwatch[50]!,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          collapsedShape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.primary),
          ),
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          childrenPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          title: Text(
            settingsModel.title!,
            style: AppStyles.fontsRegular14(
              context,
            ).copyWith(color: AppColors.titleTextColor),
          ),
          leading: SvgPicture.asset(
            Assets.iconsAbout,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcATop),
          ),
          iconColor: AppColors.primary,
          collapsedIconColor: AppColors.primary,
          children: [
            Text(
              settingsModel.description!,
              style: AppStyles.fontsRegular14(
                context,
              ).copyWith(color: AppColors.bodyTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
