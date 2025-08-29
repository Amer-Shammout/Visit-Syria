import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Home/Data/Models/weather_model.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/weather_card.dart';
import 'package:visit_syria/Features/Weather/Presentation/views/widgets/today_weather_cards_grid_view.dart';

class WeatherViewBody extends StatefulWidget {
  const WeatherViewBody({super.key, required this.weatherForWeek});
  final List<WeatherModel> weatherForWeek;

  @override
  State<WeatherViewBody> createState() => _WeatherViewBodyState();
}

class _WeatherViewBodyState extends State<WeatherViewBody> {
  int selectDayIndex = 0;

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
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                    ) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: SvgPicture.asset(
                      key: ValueKey<int>(selectDayIndex),
                      getWeatherState(
                        widget.weatherForWeek[selectDayIndex].conditionType!,
                      ),
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
              Flexible(child: SizedBox(width: 100)),
              Expanded(
                flex: 2,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                  ) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: Column(
                    key: ValueKey<int>(selectDayIndex),
                    children: [
                      Text(
                        widget.weatherForWeek[selectDayIndex].conditionType!,
                        style: AppStyles.fontsRegular20(
                          context,
                        ).copyWith(color: AppColors.graySwatch[800]),
                      ),
                      SizedBox(height: AppSpacing.s16),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          textDirection: TextDirection.ltr,
                          '${widget.weatherForWeek[selectDayIndex].tempC}\u00B0',
                          style: AppStyles.fontsBold64(context),
                        ),
                      ),
                      SizedBox(height: AppSpacing.s12),
                      Text(
                        widget.weatherForWeek[selectDayIndex].dayName!,
                        style: AppStyles.fontsBold14(
                          context,
                        ).copyWith(color: AppColors.titleTextColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TodayWeatherCardsGridView(
            weatherForWeek: widget.weatherForWeek,
            selectedIndex: selectDayIndex,
            onDaySelected: (index) {
              setState(() {
                selectDayIndex = index;
              });
            },
          ),
        ),
      ],
    );
  }
}
