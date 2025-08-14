import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';

abstract class TripRepo {
  Future<Either<Failure, List<TripModel>>> getTripsByCategory(
    final String category,
  );
  Future<Either<Failure, List<TripModel>>> getTripsCompany(
    final int companyID,
    final String category,
  );
  Future<Either<Failure, List<TripModel>>> getSimilarTrips(final int tripID);
}
