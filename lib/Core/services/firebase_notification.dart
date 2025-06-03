import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';

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
  }
}
