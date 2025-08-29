import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/AI%20Assistant/Data/Models/ai_prefferences_model.dart';
import 'package:visit_syria/Features/AI%20Assistant/Data/Models/ai_trip_model/ai_trip_model.dart';
import 'package:visit_syria/Features/AI%20Assistant/Data/Repos/ai_repo.dart';

part 'generate_ai_trip_state.dart';

class GenerateAiTripCubit extends Cubit<GenerateAiTripState> {
  GenerateAiTripCubit(this._aiRepo) : super(GenerateAiTripInitial());
  final AIRepo _aiRepo;

  Future<void> generateTrip(AiPrefferencesModel aiPrefferencesModel) async {
    emit(GenerateAiTripLoading());
    var result = await _aiRepo.generateTrip(aiPrefferencesModel);
    result.fold(
      (failure) => emit(GenerateAiTripFailure(errMessage: failure.errMessage)),
      (aiTrip) {
        aiTrip.showButton = true;
        emit(GenerateAiTripSuccess(aiTripModel: aiTrip));
      },
    );
  }
}
