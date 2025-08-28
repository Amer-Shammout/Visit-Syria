part of 'get_notifications_cubit.dart';

sealed class GetNotificationsState extends Equatable {
  const GetNotificationsState();

  @override
  List<Object> get props => [];
}

final class GetNotificationsInitial extends GetNotificationsState {}

final class GetNotificationsSuccess extends GetNotificationsState {
  final List<NotificationModel> notification;

  const GetNotificationsSuccess({required this.notification});
}

final class GetNotificationsFailure extends GetNotificationsState {
  final String errMessage;

  const GetNotificationsFailure({required this.errMessage});
}

final class GetNotificationsLoading extends GetNotificationsState {}

final class GetNotificationsEmpty extends GetNotificationsState {}
