part of 'cancel_reservation_cubit.dart';

sealed class CancelReservationState extends Equatable {
  const CancelReservationState();

  @override
  List<Object> get props => [];
}

final class CancelReservationInitial extends CancelReservationState {}

final class CancelReservationLoading extends CancelReservationState {}

final class CancelReservationSuccess extends CancelReservationState {
  final RefundModel refundModel;

  const CancelReservationSuccess({required this.refundModel});
}

final class CancelReservationNotPermission extends CancelReservationState {
  final String message;

  const CancelReservationNotPermission({required this.message});
}

final class CancelReservationFailure extends CancelReservationState {
  final String errMessage;

  const CancelReservationFailure({required this.errMessage});
}
