part of 'get_my_booking_cubit.dart';

sealed class GetMyBookingState extends Equatable {
  const GetMyBookingState();

  @override
  List<Object> get props => [];
}

final class GetMyBookingInitial extends GetMyBookingState {}

final class GetMyBookingLoading extends GetMyBookingState {}

final class GetMyBookingSuccess extends GetMyBookingState {
  final GetMyBookingModel getMyBookingModel;

  const GetMyBookingSuccess({required this.getMyBookingModel});
}

final class GetMyBookingEmpty extends GetMyBookingState {}

final class GetMyBookingFailure extends GetMyBookingState {
  final String errMessage;

  const GetMyBookingFailure({required this.errMessage});
}
