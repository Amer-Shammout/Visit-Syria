part of 'get_similar_trips_cubit.dart';

sealed class GetSimilarTripsState extends Equatable {
  const GetSimilarTripsState();

  @override
  List<Object> get props => [];
}

final class GetSimilarTripsInitial extends GetSimilarTripsState {}

final class GetSimilarTripsLoading extends GetSimilarTripsState {}

final class GetSimilarTripsSuccess extends GetSimilarTripsState {
  final List<TripModel> similarTrips;

  const GetSimilarTripsSuccess({required this.similarTrips});
}

final class GetSimilarTripsEmpty extends GetSimilarTripsState {}

final class GetSimilarTripsFailure extends GetSimilarTripsState {
  final String errMessage;

 const GetSimilarTripsFailure({required this.errMessage});
}
