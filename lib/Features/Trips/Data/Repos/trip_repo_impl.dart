import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/functions/handle_request.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';
import 'package:visit_syria/Features/Trips/Data/Repos/trip_repo.dart';

class TripRepoImpl extends TripRepo {
  @override
  Future<Either<Failure, List<TripModel>>> getSimilarTrips(int tripID) async {
    return await handleRequest<List<TripModel>>(
      requestFn:
          () => getIt.get<DioClient>().get(
            "$kGetSimilarTripsUrl$tripID",
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        final List<TripModel> similarTrips = [];
        for (var item in data["trips"]) {
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
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        final List<TripModel> trips = [];
        for (var item in data["trips"]) {
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
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
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
