import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationController extends GetxController {
  var title = ''.obs;
  var body = ''.obs;
  var data = {}.obs;
  RemoteMessage? latestMessage;

  @override
  void onInit() {
    super.onInit();
    print("NotificationController initialized");
  }

  @override
  void onReady() {
    super.onReady();
    if (latestMessage != null) {
      updateNotification(latestMessage!);
    }
    print("NotificationController is ready");
  }

  @override
  void onClose() {
    print("NotificationController is being closed");
    super.onClose();
  }

  void updateNotification(RemoteMessage message) {
    title.value = message.notification?.title ?? 'No Title';
    body.value = message.notification?.body ?? 'No Body';
    data.value = message.data;
    latestMessage = message;
  }
}