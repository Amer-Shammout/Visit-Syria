import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';

abstract class PlacesRepo {
  Future<Either<Failure, List<PlaceModel>>> getPlacesByClassificationAndCity({
    required String classification,
    required String city,
  });

  Future<Either<Failure, List<PlaceModel>>> getRestaurantsByCity({
    required String city,
  });

  Future<Either<Failure, List<PlaceModel>>> getHotelsByCity({
    required String city,
  });

  Future<Either<Failure, dynamic>> getAllCommentsByPlaceId(String placeId);

  Future<Either<Failure, dynamic>> addCommentAndRating({
    required String placeId,
    required String comment,
    required double rating,
  });

  Future<Either<Failure, dynamic>> deleteCommentAndRating(String commentId);
}
