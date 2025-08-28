part of 'generate_ai_trip_cubit.dart';

sealed class GenerateAiTripState extends Equatable {
  const GenerateAiTripState();

  @override
  List<Object> get props => [];
}

final class GenerateAiTripInitial extends GenerateAiTripState {}

final class GenerateAiTripLoading extends GenerateAiTripState {}

final class GenerateAiTripSuccess extends GenerateAiTripState {
  final AiTripModel aiTripModel;

  const GenerateAiTripSuccess({required this.aiTripModel});
}

final class GenerateAiTripFailure extends GenerateAiTripState {
  final String errMessage;

  const GenerateAiTripFailure({required this.errMessage});
}
