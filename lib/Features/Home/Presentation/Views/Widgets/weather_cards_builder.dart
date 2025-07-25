import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Home/Presentation/Manager/weather/get_weather_today_cubit/get_weather_today_cubit.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/weather_cards_list_view.dart';

class WeatherCardsBuilder extends StatelessWidget {
  const WeatherCardsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherTodayCubit, GetWeatherTodayState>(
      builder: (context, state) {
        if (state is GetWeatherTodaySuccess) {
          return WeatherCardsListView(weatherCards: state.weatherCities);
        } else if (state is GetWeatherTodayFailure) {
          return Text(state.errMessage);
        } else {
          return Center(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
