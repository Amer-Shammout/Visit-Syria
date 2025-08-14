import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/functions/handle_request.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Home/Data/Models/weather_model.dart';
import 'package:visit_syria/Features/Home/Data/Repos/home_repo.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, List<WeatherModel>>> getWeatherToday() async {
    return await handleRequest<List<WeatherModel>>(
      requestFn: () => getIt.get<DioClient>().get(kGetWeatherTodayURL),
      parse: (data) {
        final List<WeatherModel> weatherCitiesToday = [];
        for (var item in data) {
          final WeatherModel weatherModel = WeatherModel.fromJson(item);
          weatherCitiesToday.add(weatherModel);
        }

        return weatherCitiesToday;
      },
    );
  }

  @override
  Future<Either<Failure, List<WeatherModel>>> getWeatherForWeek(
    String cityName,
  ) async {
    return await handleRequest<List<WeatherModel>>(
      requestFn:
          () =>
              getIt.get<DioClient>().get("$kGetWeatherTodayURL?city=$cityName"),
      parse: (data) {
        final List<WeatherModel> weatherForWeek = [];
        for (var item in data) {
          final WeatherModel weatherModel = WeatherModel.fromJson(item);
          weatherForWeek.add(weatherModel);
        }

        return weatherForWeek;
      },
    );
  }

  @override
  Future<Either<Failure, List<PlaceModel>>> getTopRatedPlaces() async {
    return await handleRequest<List<PlaceModel>>(
      requestFn:
          () => getIt.get<DioClient>().get(
            kGetTopRatedTouristPlacesUrl,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        final List<PlaceModel> places = [];
        for (var item in data['data']) {
          places.add(PlaceModel.fromJson(item));
        }
        return places;
      },
    );
  }

  @override
  Future<Either<Failure, List<EventModel>>> getAllEvents() async {
    return await handleRequest<List<EventModel>>(
      requestFn:
          () => getIt.get<DioClient>().get(
            kGetAllEventsURL,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse:
          (events) =>
              (events as List).map((e) => EventModel.fromJson(e)).toList(),
    );
  }
}
