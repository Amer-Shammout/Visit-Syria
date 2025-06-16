import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Weather/Presentation/views/widgets/today_weather_cards_grid_view.dart';

class WeatherViewBody extends StatelessWidget {
  const WeatherViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.asset(Assets.iconsSunny, fit: BoxFit.fill),
                ),
              ),
              Flexible(child: SizedBox(width: 100)),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(
                      'مشمس',
                      style: AppStyles.fontsRegular20(
                        context,
                      ).copyWith(color: AppColors.graySwatch[800]),
                    ),
                    SizedBox(height: AppSpacing.s16),
                    Text(
                      textDirection: TextDirection.ltr,
                      '29\u00B0',
                      style: AppStyles.fontsBold64(context),
                    ),
                    SizedBox(height: AppSpacing.s12),
                    Text(
                      'الخميس',
                      style: AppStyles.fontsBold14(
                        context,
                      ).copyWith(color: AppColors.titleTextColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(child: TodayWeatherCardsGridView()),
      ],
    );
  }
}
