part of 'get_trips_by_category_cubit.dart';

sealed class GetTripsByCategoryState extends Equatable {
  const GetTripsByCategoryState();

  @override
  List<Object> get props => [];
}

final class GetTripsByCategoryInitial extends GetTripsByCategoryState {}

final class GetTripsByCategoryLoading extends GetTripsByCategoryState {}

final class GetTripsByCategorySuccess extends GetTripsByCategoryState {
  final List<TripModel> trips;

  const GetTripsByCategorySuccess({required this.trips});
}

final class GetTripsByCategoryEmpty extends GetTripsByCategoryState {}

final class GetTripsByCategoryFailure extends GetTripsByCategoryState {
  final String errMessage;

  const GetTripsByCategoryFailure({required this.errMessage});
}
