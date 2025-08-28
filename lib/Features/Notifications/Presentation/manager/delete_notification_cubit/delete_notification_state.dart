part of 'delete_notification_cubit.dart';

sealed class DeleteNotificationState extends Equatable {
  const DeleteNotificationState();

  @override
  List<Object> get props => [];
}

final class DeleteNotificationInitial extends DeleteNotificationState {}

final class DeleteNotificationSuccess extends DeleteNotificationState {}

final class DeleteNotificationFailure extends DeleteNotificationState {
  final String errMessage;

  const DeleteNotificationFailure({required this.errMessage});
}

final class DeleteNotificationLoading extends DeleteNotificationState {}
