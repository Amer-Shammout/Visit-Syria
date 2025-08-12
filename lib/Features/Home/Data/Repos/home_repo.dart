import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Home/Data/Models/weather_model.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<WeatherModel>>> getWeatherToday();
  Future<Either<Failure, List<WeatherModel>>> getWeatherForWeek(
    String cityName,
  );
    Future<Either<Failure, List<PlaceModel>>> getTopRatedPlaces();
  Future<Either<Failure, List<EventModel>>> getAllEvents();

}
