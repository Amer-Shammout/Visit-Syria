part of 'event_and_trips_booking_cubit.dart';

sealed class EventAndTripsBookingState extends Equatable {
  const EventAndTripsBookingState();

  @override
  List<Object> get props => [];
}

final class EventAndTripsBookingInitial extends EventAndTripsBookingState {}

final class EventAndTripsBookingLoading extends EventAndTripsBookingState {}

final class EventAndTripsBookingSuccess extends EventAndTripsBookingState {
  final BookingModel bookingModel;

  const EventAndTripsBookingSuccess({required this.bookingModel});
}

final class EventAndTripsBookingFailure extends EventAndTripsBookingState {
  final String errMessage;

  const EventAndTripsBookingFailure({required this.errMessage});
}
