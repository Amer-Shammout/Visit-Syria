part of 'get_weather_today_cubit.dart';

sealed class GetWeatherTodayState extends Equatable {
  const GetWeatherTodayState();

  @override
  List<Object> get props => [];
}

final class GetWeatherTodayInitial extends GetWeatherTodayState {}

final class GetWeatherTodayLoading extends GetWeatherTodayState {}

final class GetWeatherTodaySuccess extends GetWeatherTodayState {
  final List<WeatherModel> weatherCities;

  const GetWeatherTodaySuccess({required this.weatherCities});
}

final class GetWeatherTodayFailure extends GetWeatherTodayState {
  final String errMessage;

  const GetWeatherTodayFailure({required this.errMessage});
}
