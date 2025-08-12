import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/utils/functions/handle_request.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';
import 'package:visit_syria/Features/Trips/Data/Repos/trip_repo.dart';

class TripRepoImpl extends TripRepo {
  @override
  Future<Either<Failure, List<TripModel>>> getSimilarTrips(int tripID) async {
    return await handleRequest<List<TripModel>>(
      requestFn:
          () => getIt.get<DioClient>().get("$kGetSimilarTripsUrl$tripID"),
      parse: (data) {
        final List<TripModel> similarTrips = [];
        for (var item in data) {
          final TripModel tripModel = TripModel.fromJson(item);
          similarTrips.add(tripModel);
        }

        return similarTrips;
      },
    );
  }

  @override
  Future<Either<Failure, List<TripModel>>> getTripsByCategory(
    String category,
  ) async {
    final encodedCategory = Uri.encodeComponent(category);
    return await handleRequest<List<TripModel>>(
      requestFn:
          () => getIt.get<DioClient>().get(
            "$kGetTripsByCategoryUrl?tag=$encodedCategory",
          ),
      parse: (data) {
        final List<TripModel> trips = [];
        for (var item in data) {
          final TripModel tripModel = TripModel.fromJson(item);
          trips.add(tripModel);
        }

        return trips;
      },
    );
  }

  @override
  Future<Either<Failure, List<TripModel>>> getTripsCompany(
    int companyID,
    String category,
  ) async {
    final encodedCategory = Uri.encodeComponent(category);
    return await handleRequest<List<TripModel>>(
      requestFn:
          () => getIt.get<DioClient>().get(
            "$kGetTripsCompanyUrl$companyID?tag=$encodedCategory",
          ),
      parse: (data) {
        final List<TripModel> companyTrips = [];
        for (var item in data) {
          final TripModel tripModel = TripModel.fromJson(item);
          companyTrips.add(tripModel);
        }

        return companyTrips;
      },
    );
  }
}
