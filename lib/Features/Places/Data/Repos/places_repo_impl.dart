import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/utils/functions/handle_request.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';
import 'package:visit_syria/Features/Places/Data/Repos/places_repo.dart';


class PlacesRepoImpl extends PlacesRepo {
 

  @override
  Future<Either<Failure, List<PlaceModel>>> getPlacesByClassificationAndCity({
    required String classification,
    required String city,
  }) async {
    final encodedClassification = Uri.encodeComponent(classification);
    final encodedCity = Uri.encodeComponent(city);

    final url =
        "$kGetPlacesByClassificationAndCityUrl$encodedClassification/city/$encodedCity";

    return await handleRequest<List<PlaceModel>>(
      requestFn: () => getIt.get<DioClient>().get(url),
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
  Future<Either<Failure, List<PlaceModel>>> getRestaurantsByCity({
    required String city,
  }) async {
    final encodedCity = Uri.encodeComponent(city);
    final url = "$kGetResturantsByCityUrl?city=$encodedCity";

    return await handleRequest<List<PlaceModel>>(
      requestFn: () => getIt.get<DioClient>().get(url),
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
  Future<Either<Failure, List<PlaceModel>>> getHotelsByCity({
    required String city,
  }) async {
    final encodedCity = Uri.encodeComponent(city);
    final url = "$kGetHotelsByCityUrl?city=$encodedCity";

    return await handleRequest<List<PlaceModel>>(
      requestFn: () => getIt.get<DioClient>().get(url),
      parse: (data) {
        final List<PlaceModel> places = [];
        for (var item in data['data']) {
          places.add(PlaceModel.fromJson(item));
        }
        return places;
      },
    );
  }

  // باقي الدوال بدون implementation
  @override
  Future<Either<Failure, dynamic>> getAllCommentsByPlaceId(String placeId) {
    // TODO: implement
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> addCommentAndRating({
    required String placeId,
    required String comment,
    required double rating,
  }) {
    // TODO: implement
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> deleteCommentAndRating(String commentId) {
    // TODO: implement
    throw UnimplementedError();
  }
}
