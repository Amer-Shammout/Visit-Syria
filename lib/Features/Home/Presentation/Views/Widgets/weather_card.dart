import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Features/Home/Data/Models/weather_model.dart';
import 'package:visit_syria/Features/Home/Presentation/Manager/weather/get_weather_for_week_cubit/get_weather_for_week_cubit.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8),
          highlightColor: AppColors.graySwatch[100],
          splashColor: AppColors.graySwatch[50],
          onTap: () async {
            GoRouter.of(
              context,
            ).pushNamed(AppRouter.kWeatherName, extra: weatherModel.location);
            await BlocProvider.of<GetWeatherForWeekCubit>(
              context,
            ).getWeatherForWeek(weatherModel.location!);
          },
          child: Ink(
            // width: 50,
            height: 82,
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
                  getWeatherState(weatherModel.conditionType!),
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
                  '${weatherModel.tempC}\u00B0 C',
                  style: AppStyles.fontsRegular12(
                    context,
                  ).copyWith(color: AppColors.primary, fontSize: 9),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: AppSpacing.s4),
        Text(
          weatherModel.location!,
          style: AppStyles.fontsRegular14(
            context,
          ).copyWith(color: AppColors.primary, fontSize: 11),
        ),
      ],
    );
  }
}

String getWeatherState(String conditionType) {
  if (conditionType == 'sun') return Assets.iconsSunny;
  if (conditionType == 'cloud') return Assets.iconsCloudy;
  if (conditionType == 'tornado') return Assets.iconsTornado;
  if (conditionType == 'thunder') return Assets.iconsThunder;
  if (conditionType == 'rain') return Assets.iconsRain;
  if (conditionType == 'snow') return Assets.iconsSnowy;
  if (conditionType == 'sleet') return Assets.iconsRainThunder;

  return Assets.iconsSunny;
}
