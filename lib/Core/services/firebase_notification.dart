import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:visit_syria/Core/services/notification_sound.dart';
import 'package:visit_syria/Core/services/notifications_cubit.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';

abstract class FirebaseNotification {
  static String? fcmToken;
  static bool? isActive;
  static Future<void> getFCMToken() async {
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    await firebaseMessaging.requestPermission();
    if (await Permission.notification.isDenied) {
      isActive = false;
    } else {
      fcmToken = await firebaseMessaging.getToken();
      isActive = true;
    }

    log(fcmToken ?? 'no token');
    FirebaseMessaging.onMessage.listen((message) {
      AppRouter.navigatorKey.currentState?.context;
      log("message");
      final context = AppRouter.navigatorKey.currentContext;
      if (context != null) {
      NotificationSound.play();
        context.read<NotificationCubit>().showBadge();
        showTopSnackBar(
          message.notification?.title ?? "Hello Sir",
          message.notification?.body ?? "",
          context,
        );
      }
    });
  }
}
