import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class HistoryandSearchTile extends StatelessWidget {
  const HistoryandSearchTile({
    super.key,
    required this.title,
    required this.onTap,
    this.icon = Assets.iconsHistory,
    this.country,
  });

  final String title;
  final String icon;
  final VoidCallback onTap;
  final String? country;

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
                  icon,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcATop,
                  ),
                ),
                SizedBox(width: AppSpacing.s8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppStyles.fontsRegular16(
                        context,
                      ).copyWith(color: AppColors.titleTextColor),
                    ),
                    country != null
                        ? SizedBox(height: AppSpacing.s2)
                        : SizedBox.shrink(),
                    country != null
                        ? Text(
                          country!,
                          style: AppStyles.fontsLight12(
                            context,
                            12,
                          ).copyWith(color: AppColors.bodyTextColor),
                        )
                        : SizedBox.shrink(),
                  ],
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
