import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _fcm.requestPermission();

    String? token = await _fcm.getToken();
    print("Firebase Token: $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Pesan diterima: ${message.notification?.title}");
    });
  }
}
