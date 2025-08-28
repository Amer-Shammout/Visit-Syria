import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Notifications/Data/Models/notification_model.dart';
import 'package:visit_syria/Features/Notifications/Data/repos/notifications_repo.dart';

part 'get_notifications_state.dart';

class GetNotificationsCubit extends Cubit<GetNotificationsState> {
  GetNotificationsCubit(this._notificationsRepo)
    : super(GetNotificationsInitial());
  final NotificationsRepo _notificationsRepo;
  List<NotificationModel> _notifications = [];

  Future<void> getNotifications(bool read) async {
    emit(GetNotificationsLoading());
    final result = await _notificationsRepo.getNotifications(read: read);
    result.fold(
      (l) => emit(GetNotificationsFailure(errMessage: l.errMessage)),
      (notifications) {
        if (notifications.isEmpty) {
          emit(GetNotificationsEmpty());
        } else {
          _notifications = notifications;
          emit(GetNotificationsSuccess(notification: _notifications));
        }
      },
    );
  }

  void removeNotification(String id) {
    _notifications.removeWhere((n) => n.id == id);
    emit(GetNotificationsSuccess(notification: _notifications)); 
  }
}
