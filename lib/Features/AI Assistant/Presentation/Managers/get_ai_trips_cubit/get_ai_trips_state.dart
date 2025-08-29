part of 'get_ai_trips_cubit.dart';

sealed class GetAiTripsState extends Equatable {
  const GetAiTripsState();

  @override
  List<Object> get props => [];
}

final class GetAiTripsInitial extends GetAiTripsState {}

final class GetAiTripsLoading extends GetAiTripsState {}

final class GetAiTripsSuccess extends GetAiTripsState {
  final List<AiTripModel> aiTrips;

  const GetAiTripsSuccess({required this.aiTrips});
}

final class GetAiTripsEmpty extends GetAiTripsState {}

final class GetAiTripsFailure extends GetAiTripsState {
  final String errMessage;

  const GetAiTripsFailure({required this.errMessage});
}
