import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertest/main.dart';
import 'package:fluttertest/screen/notificationscreen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/notification_controller.dart';
Future<void>handleBackgroundMessage(RemoteMessage message)async{
  print('Title:${message.notification?.title}');
  print('Body:${message.notification?.body}');
  print('payload:${message.data}');

}
class FirebaseApi{
final _firebaseMessaging=FirebaseMessaging.instance;
final NotificationController notificationController = Get.put(NotificationController());
void handleMessage(RemoteMessage? message) {
  if (message == null) return;
  notificationController.updateNotification(message);
  navigatorKey.currentState?.pushNamed(NotificationScreen.route, arguments: message);
}
   Future initPushNotifications()async{
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
}

Future<void>initNotifications()async{
  await _firebaseMessaging.requestPermission();
  final fCMToken=await _firebaseMessaging.getToken();
  print('Token:$fCMToken');
initPushNotifications();
}

}