import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';
import 'package:visit_syria/Features/Trips/Data/Repos/trip_repo.dart';

part 'get_company_trips_state.dart';

class GetCompanyTripsCubit extends Cubit<GetCompanyTripsState> {
  GetCompanyTripsCubit(this._tripRepo) : super(GetCompanyTripsInitial());
  final TripRepo _tripRepo;
  Future<void> getCompanyTrips(
    final int companyID,
    final String category,
  ) async {
    emit(GetCompanyTripsLoading());
    var result = await _tripRepo.getTripsCompany(companyID, category);

    result.fold(
      (failure) {
        emit(GetCompanyTripsFailure(errMessage: failure.errMessage));
      },
      (companyTrips) {
        companyTrips.isEmpty
            ? emit(GetCompanyTripsEmpty())
            : emit(GetCompanyTripSuccess(companyTrips: companyTrips));
      },
    );
  }
}
