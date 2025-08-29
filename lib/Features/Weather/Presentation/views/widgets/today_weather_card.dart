import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Features/Home/Data/Models/weather_model.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/weather_card.dart';

class TodayWeatherCard extends StatelessWidget {
  const TodayWeatherCard({
    super.key,
    required this.isSelected,
    required this.weather,
  });
  final WeatherModel weather;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 106,
      child: AspectRatio(
        aspectRatio: 177 / 106,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [Shadows.weatherCardShadow],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? AppColors.primary : Colors.transparent,
              width: 2,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: SvgPicture.asset(
                  getWeatherState(weather.conditionType!),
                  width: 48,
                  height: 48,
                ),
              ),
              Flexible(child: SizedBox(width: AppSpacing.s20)),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        weather.dayName!,
                        style: AppStyles.fontsRegular14(
                          context,
                        ).copyWith(color: AppColors.graySwatch[800]),
                      ),
                    ),
                    SizedBox(height: AppSpacing.s4),
                    Text(
                      weather.conditionType!,
                      style: AppStyles.fontsBold16(
                        context,
                      ).copyWith(color: AppColors.titleTextColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
