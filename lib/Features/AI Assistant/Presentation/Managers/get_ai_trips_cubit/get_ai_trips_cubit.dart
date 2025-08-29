import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/AI%20Assistant/Data/Models/ai_trip_model/ai_trip_model.dart';
import 'package:visit_syria/Features/AI%20Assistant/Data/Repos/ai_repo.dart';

part 'get_ai_trips_state.dart';

class GetAiTripsCubit extends Cubit<GetAiTripsState> {
  GetAiTripsCubit(this._aiRepo) : super(GetAiTripsInitial());
  final AIRepo _aiRepo;
  Future<void> getAITrips() async {
    emit(GetAiTripsLoading());
    var result = await _aiRepo.getAITrips();
    result.fold(
      (failure) => emit(GetAiTripsFailure(errMessage: failure.errMessage)),
      (aiTrips) {
        aiTrips.isEmpty
            ? emit(GetAiTripsEmpty())
            : emit(GetAiTripsSuccess(aiTrips: aiTrips));
      },
    );
  }
}
