import 'package:flutter/material.dart';
import 'package:fluttertest/controllers/notification_controller.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const route = '/notification-screen';

  @override
  Widget build(BuildContext context) {
    final notificationController = Get.find<NotificationController>();

    return Scaffold(
      appBar: AppBar(title: Text('Push Notification')),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Title: ${notificationController.title}'),
              Text('Body: ${notificationController.body}'),
              Text('Payload: ${notificationController.data}'),
            ],
          );
        }),
      ),
    );
  }
}