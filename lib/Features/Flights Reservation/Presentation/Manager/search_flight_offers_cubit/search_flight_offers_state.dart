import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';

abstract class SearchFlightOffersState extends Equatable {
  const SearchFlightOffersState();

  @override
  List<Object?> get props => [];
}

class SearchFlightOffersInitial extends SearchFlightOffersState {}
class SearchFlightOffersEmpty extends SearchFlightOffersState {}

class SearchFlightOffersLoading extends SearchFlightOffersState {}

class SearchFlightOffersSuccess extends SearchFlightOffersState {
  final List<FlightModel> flights;
  const SearchFlightOffersSuccess(this.flights);

  @override
  List<Object?> get props => [flights];
}

class SearchFlightOffersFailure extends SearchFlightOffersState {
  final String message;
  const SearchFlightOffersFailure(this.message);

  @override
  List<Object?> get props => [message];
}
