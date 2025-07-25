import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/Home/Data/Models/weather_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<WeatherModel>>> getWeatherToday();
  Future<Either<Failure, List<WeatherModel>>> getWeatherForWeek(
    String cityName,
  );
}
