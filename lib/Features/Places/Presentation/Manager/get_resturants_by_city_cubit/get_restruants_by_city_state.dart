import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';

abstract class GetRestaurantsByCityState extends Equatable {
  const GetRestaurantsByCityState();

  @override
  List<Object?> get props => [];
}

class GetRestaurantsByCityInitial extends GetRestaurantsByCityState {}

class GetRestaurantsByCityLoading extends GetRestaurantsByCityState {}

class GetRestaurantsByCitySuccess extends GetRestaurantsByCityState {
  final List<PlaceModel> places;
  const GetRestaurantsByCitySuccess(this.places);

  @override
  List<Object?> get props => [places];
}

class GetRestaurantsByCityFailure extends GetRestaurantsByCityState {
  final String message;
  const GetRestaurantsByCityFailure(this.message);

  @override
  List<Object?> get props => [message];
}
