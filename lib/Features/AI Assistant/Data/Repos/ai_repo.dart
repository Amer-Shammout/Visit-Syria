import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/AI%20Assistant/Data/Models/ai_prefferences_model.dart';
import 'package:visit_syria/Features/AI%20Assistant/Data/Models/ai_trip_model/ai_trip_model.dart';

abstract class AIRepo {
  Future<Either<Failure, List<AiTripModel>>> getAITrips();
  Future<Either<Failure, AiTripModel>> generateTrip(
    AiPrefferencesModel aiPrefferncesModel,
  );
}
