import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Features/Notifications/Data/Models/notification_model.dart';
import 'package:visit_syria/Features/Notifications/Data/repos/notifications_repo.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/functions/handle_request.dart';

class NotificationsRepoImpl extends NotificationsRepo {
  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications({
    required bool read,
  }) {
    final url = "$kGetNotificationsUrl${read ? 'read' : 'unread'}";

    return handleRequest(
      requestFn:
          () => getIt.get<DioClient>().get(
            url,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        final List<NotificationModel> notifications = [];
        for (var n in data['notifications']) {
          notifications.add(NotificationModel.fromJson(n));
        }
        return notifications;
      },
    );
  }

  @override
  Future<Either<Failure, dynamic>> deleteNotification({required String id}) {
    final url = "$kDeleteNotificationsUrl$id";

    return handleDelete(
      requestFn:
          () => getIt.get<DioClient>().delete(
            url,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
    );
  }
}
