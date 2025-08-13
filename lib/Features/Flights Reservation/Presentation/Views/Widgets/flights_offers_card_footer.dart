import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class FlightsOffersCardFooter extends StatelessWidget {
  const FlightsOffersCardFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constrains) {
            return Dash(
              direction: Axis.horizontal,
              length: constrains.maxWidth,
              dashLength: 8,
              dashGap: 4,
              dashColor: AppColors.graySwatch[300]!,
              dashThickness: 1,
            );
          },
        ),
        SizedBox(height: AppSpacing.s16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.iconsTicket,
                  width: 16,
                  height: 16,
                  colorFilter: ColorFilter.mode(
                    AppColors.bodyTextColor,
                    BlendMode.srcATop,
                  ),
                ),
                SizedBox(width: AppSpacing.s4),
                Text(
                  "10 تذاكر متبقية",
                  style: AppStyles.fontsLight10(
                    context,
                  ).copyWith(color: AppColors.bodyTextColor),
                ),
              ],
            ),
            Text(
              "1000\$",
              style: AppStyles.fontsBold18(
                context,
              ).copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ],
    );
  }
}
