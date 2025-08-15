import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Repos/flights_repo.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Manager/search_airports_cubit/search_airports_state.dart';

class SearchAirportsCubit extends Cubit<SearchAirportsState> {
  final FlightsRepo _flightsRepo;
  SearchAirportsCubit(this._flightsRepo) : super(SearchAirportsInitial());

  Future<void> fetchAirports(String keyword) async {
    emit(SearchAirportsLoading());
    final result = await _flightsRepo.searchAirports(keyword: keyword);
    result.fold((failure) => emit(SearchAirportsFailure(failure.errMessage)), (
      airports,
    ) {
      if (airports.isEmpty) {
        emit(SearchAirportsEmpty());
      } else {
        emit(SearchAirportsSuccess(airports));
      }
    });
  }
}
