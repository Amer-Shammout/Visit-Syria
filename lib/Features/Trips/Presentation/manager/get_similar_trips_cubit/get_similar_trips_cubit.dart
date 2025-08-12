import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';
import 'package:visit_syria/Features/Trips/Data/Repos/trip_repo.dart';

part 'get_similar_trips_state.dart';

class GetSimilarTripsCubit extends Cubit<GetSimilarTripsState> {
  GetSimilarTripsCubit(this._tripRepo) : super(GetSimilarTripsInitial());
  final TripRepo _tripRepo;
  Future<void> getSimilarTrips(final int TripID) async {
    emit(GetSimilarTripsLoading());
    var result = await _tripRepo.getSimilarTrips(TripID);

    result.fold(
      (failure) {
        emit(GetSimilarTripsFailure(errMessage: failure.errMessage));
      },
      (similarTrips) {
        similarTrips.isEmpty
            ? emit(GetSimilarTripsEmpty())
            : emit(GetSimilarTripsSuccess(similarTrips: similarTrips));
      },
    );
  }
}
