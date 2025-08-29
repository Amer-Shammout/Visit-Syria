import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/functions/handle_request.dart';
import 'package:visit_syria/Features/AI%20Assistant/Data/Models/ai_prefferences_model.dart';
import 'package:visit_syria/Features/AI%20Assistant/Data/Models/ai_trip_model/ai_trip_model.dart';
import 'package:visit_syria/Features/AI%20Assistant/Data/Repos/ai_repo.dart';

class AIRepoImpl extends AIRepo {
  @override
  Future<Either<Failure, List<AiTripModel>>> getAITrips() async {
    return await handleRequest(
      requestFn:
          () => getIt.get<DioClient>().get(
            kAITripsURL,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        final List<AiTripModel> aiTrips = [];
        for (var item in data["data"]) {
          final AiTripModel aiTripModel = AiTripModel.fromJson(item);
          aiTrips.add(aiTripModel);
        }

        return aiTrips;
      },
    );
  }

  @override
  Future<Either<Failure, AiTripModel>> generateTrip(
    AiPrefferencesModel aiPrefferncesModel,
  ) async {
    return await handleRequest(
      requestFn:
          () => getIt.get<DioClient>().post(
            kAIGenerateTripURL,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
            data: aiPrefferncesModel.toJson(),
          ),
      parse: (data) => AiTripModel.fromJson(data),
    );
  }
}
