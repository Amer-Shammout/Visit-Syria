import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.iconsHistory,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcATop,
                  ),
                ),
                SizedBox(width: AppSpacing.s8),
                Text(
                  title,
                  style: AppStyles.fontsRegular16(
                    context,
                  ).copyWith(color: AppColors.titleTextColor),
                ),
              ],
            ),
            SvgPicture.asset(
              Assets.iconsArrow,
              height: 20,
              width: 20,
              colorFilter: ColorFilter.mode(
                AppColors.titleTextColor,
                BlendMode.srcATop,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
