part of 'get_all_events_cubit.dart';

sealed class GetAllEventsState extends Equatable {
  const GetAllEventsState();

  @override
  List<Object> get props => [];
}

final class GetAllEventsInitial extends GetAllEventsState {}

final class GetAllEventsFailure extends GetAllEventsState {
  final String errMessage;

  const GetAllEventsFailure({required this.errMessage});
}

final class GetAllEventsLoading extends GetAllEventsState {}

final class GetAllEventsSuccess extends GetAllEventsState {
  final List<EventModel> events;

  const GetAllEventsSuccess({required this.events});
}
