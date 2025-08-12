import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';
import 'package:visit_syria/Features/Trips/Data/Repos/trip_repo.dart';

part 'get_trips_by_category_state.dart';

class GetTripsByCategoryCubit extends Cubit<GetTripsByCategoryState> {
  GetTripsByCategoryCubit(this._tripRepo) : super(GetTripsByCategoryInitial());

  final TripRepo _tripRepo;
  Future<void> getTripsByCategory(final String category) async {
    emit(GetTripsByCategoryLoading());
    var result = await _tripRepo.getTripsByCategory(category);

    result.fold(
      (failure) {
        emit(GetTripsByCategoryFailure(errMessage: failure.errMessage));
      },
      (trips) {
        trips.isEmpty
            ? emit(GetTripsByCategoryEmpty())
            : emit(GetTripsByCategorySuccess(trips: trips));
      },
    );
  }
}
