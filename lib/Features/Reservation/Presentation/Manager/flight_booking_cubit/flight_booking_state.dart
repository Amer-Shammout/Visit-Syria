part of 'flight_booking_cubit.dart';

sealed class FlightBookingState extends Equatable {
  const FlightBookingState();

  @override
  List<Object> get props => [];
}

final class FlightBookingInitial extends FlightBookingState {}

final class FlightBookingLoading extends FlightBookingState {}

final class FlightBookingSuccess extends FlightBookingState {
  final BookingModel bookingModel;

  const FlightBookingSuccess({required this.bookingModel});
}

final class FlightBookingFailure extends FlightBookingState {
  final String errMessage;

  const FlightBookingFailure({required this.errMessage});
}
