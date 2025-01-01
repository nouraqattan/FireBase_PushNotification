import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/api/firebase_api.dart';
import 'package:fluttertest/screen/homescreen.dart';
import 'package:fluttertest/screen/notificationscreen.dart';
import 'firebase_options.dart';
final navigatorKey=GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      home: const HomeScreen(),
      routes: {
        NotificationScreen.route:(context)=>const NotificationScreen(),
      },
    );
  }
}
