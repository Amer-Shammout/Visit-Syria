part of 'get_weather_for_week_cubit.dart';

sealed class GetWeatherForWeekState extends Equatable {
  const GetWeatherForWeekState();

  @override
  List<Object> get props => [];
}

final class GetWeatherForWeekInitial extends GetWeatherForWeekState {}

final class GetWeatherForWeekLoading extends GetWeatherForWeekState {}

final class GetWeatherForWeekSuccess extends GetWeatherForWeekState {
  final List<WeatherModel> weatherForWeek;

  const GetWeatherForWeekSuccess({required this.weatherForWeek});
}

final class GetWeatherForWeekFailure extends GetWeatherForWeekState {
  final String errMessage;

  const GetWeatherForWeekFailure({required this.errMessage});
}
