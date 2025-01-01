import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const route='/notification-screen';
  @override
  Widget build(BuildContext context) {
    final RemoteMessage? message = ModalRoute.of(context)!.settings.arguments as RemoteMessage?;    return Scaffold(
      appBar: AppBar(title: Text('push-Notification'),),
      body: Center(child: (Column(
        children: [
          Text('Title:${message?.notification?.title}'),
          Text('Body:${message?.notification?.body}'),
          Text('payload:${message?.data}'),
        ],
      )),),
    );
  }
}
