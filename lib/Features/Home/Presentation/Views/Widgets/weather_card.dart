import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 50,
          height: 64,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [Shadows.weatherCardShadow],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.iconsSunny,
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcATop,
                ),
              ),
              SizedBox(height: AppSpacing.s4),
              Text(
                textDirection: TextDirection.ltr,
                '29\u00B0 C',
                style: AppStyles.fontsRegular12(
                  context,
                ).copyWith(color: AppColors.primary, fontSize: 9),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.s4),
        Text(
          'دمشق',
          style: AppStyles.fontsRegular14(
            context,
          ).copyWith(color: AppColors.primary),
        ),
      ],
    );
  }
}
