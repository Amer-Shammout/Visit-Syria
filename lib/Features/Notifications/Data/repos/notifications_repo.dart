import 'package:dartz/dartz.dart';
import 'package:visit_syria/Features/Notifications/Data/Models/notification_model.dart';
import 'package:visit_syria/Core/errors/failures.dart';

abstract class NotificationsRepo {
  Future<Either<Failure, List<NotificationModel>>> getNotifications({
    required bool read,
  });

  Future<Either<Failure, dynamic>> deleteNotification({
    required String id,
  });
}