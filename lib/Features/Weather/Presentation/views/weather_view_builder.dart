import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Home/Presentation/Manager/weather/get_weather_for_week_cubit/get_weather_for_week_cubit.dart';
import 'package:visit_syria/Features/Weather/Presentation/views/widgets/weather_view_body.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key, required this.cityName});
  final String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: cityName,
        alignmentDirectional: AlignmentDirectional.center,
      ),
      body: BlocBuilder<GetWeatherForWeekCubit, GetWeatherForWeekState>(
        builder: (context, state) {
          if (state is GetWeatherForWeekSuccess) {
            return WeatherViewBody(weatherForWeek: state.weatherForWeek);
          } else if (state is GetWeatherForWeekFailure) {
            return Center(child: Text(state.errMessage));
          } else {
            return Center(child: CustomLoadingIndicator());
          }
        },
      ),
    );
  }
}
