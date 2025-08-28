import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Notifications/Data/repos/notifications_repo.dart';

part 'delete_notification_state.dart';

class DeleteNotificationCubit extends Cubit<DeleteNotificationState> {
  DeleteNotificationCubit(this._notificationsRepo)
    : super(DeleteNotificationInitial());
  final NotificationsRepo _notificationsRepo;

  Future<void> deleteNotifications(String id) async {
    emit(DeleteNotificationLoading());
    final result = await _notificationsRepo.deleteNotification(id: id);
    result.fold(
      (l) => emit(DeleteNotificationFailure(errMessage: l.errMessage)),
      (_) => emit(DeleteNotificationSuccess()),
    );
  }
}
