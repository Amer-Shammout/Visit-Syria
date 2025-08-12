import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';

abstract class GetPlacesByClassificationAndCityState extends Equatable {
  const GetPlacesByClassificationAndCityState();

  @override
  List<Object?> get props => [];
}

class GetPlacesByClassificationAndCityInitial extends GetPlacesByClassificationAndCityState {}

class GetPlacesByClassificationAndCityLoading extends GetPlacesByClassificationAndCityState {}

class GetPlacesByClassificationAndCityEmpty extends GetPlacesByClassificationAndCityState {}

class GetPlacesByClassificationAndCitySuccess extends GetPlacesByClassificationAndCityState {
  final List<PlaceModel> places;
  const GetPlacesByClassificationAndCitySuccess(this.places);

  @override
  List<Object?> get props => [places];
}

class GetPlacesByClassificationAndCityFailure extends GetPlacesByClassificationAndCityState {
  final String message;
  const GetPlacesByClassificationAndCityFailure(this.message);

  @override
  List<Object?> get props => [message];
}
