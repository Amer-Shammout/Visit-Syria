import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/airport_search_result_model.dart';

abstract class SearchAirportsState extends Equatable {
  const SearchAirportsState();

  @override
  List<Object?> get props => [];
}

class SearchAirportsInitial extends SearchAirportsState {}

class SearchAirportsLoading extends SearchAirportsState {}

class SearchAirportsEmpty extends SearchAirportsState {}

class SearchAirportsSuccess extends SearchAirportsState {
  final List<AirportSearchResultModel> airports;
  const SearchAirportsSuccess(this.airports);

  @override
  List<Object?> get props => [airports];
}

class SearchAirportsFailure extends SearchAirportsState {
  final String message;
  const SearchAirportsFailure(this.message);

  @override
  List<Object?> get props => [message];
}
