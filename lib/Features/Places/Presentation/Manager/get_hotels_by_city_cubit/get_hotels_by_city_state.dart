import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';

abstract class GetHotelsByCityState extends Equatable {
  const GetHotelsByCityState();

  @override
  List<Object?> get props => [];
}

class GetHotelsByCityInitial extends GetHotelsByCityState {}

class GetHotelsByCityLoading extends GetHotelsByCityState {}

class GetHotelsByCitySuccess extends GetHotelsByCityState {
  final List<PlaceModel> places;
  const GetHotelsByCitySuccess(this.places);

  @override
  List<Object?> get props => [places];
}

class GetHotelsByCityFailure extends GetHotelsByCityState {
  final String message;
  const GetHotelsByCityFailure(this.message);

  @override
  List<Object?> get props => [message];
}
