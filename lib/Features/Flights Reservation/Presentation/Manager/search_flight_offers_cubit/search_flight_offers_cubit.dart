import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_search_data.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Repos/flights_repo.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Manager/search_flight_offers_cubit/search_flight_offers_state.dart';

class SearchFlightOffersCubit extends Cubit<SearchFlightOffersState> {
  final FlightsRepo _flightsRepo;
  SearchFlightOffersCubit(this._flightsRepo)
    : super(SearchFlightOffersInitial());

  Future<void> fetchFlightOffers(FlightSearchData searchData) async {
    emit(SearchFlightOffersLoading());
    final result = await _flightsRepo.searchFlightOffers(
      searchData: searchData,
    );
    result.fold(
      (failure) => emit(SearchFlightOffersFailure(failure.errMessage)),
      (flights) {
        if (flights.isEmpty) {
          emit(SearchFlightOffersEmpty());
        } else {
          emit(SearchFlightOffersSuccess(flights));
        }
      },
    );
  }
}
