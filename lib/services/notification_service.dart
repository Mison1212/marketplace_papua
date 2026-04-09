import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    // Meminta izin notifikasi (penting untuk iOS/Android 13+)
    await _fcm.requestPermission();

    // Mendapatkan token untuk testing (opsional)
    String? token = await _fcm.getToken();
    print("Firebase Token: $token");

    // Menangani notifikasi saat aplikasi di foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Pesan diterima: ${message.notification?.title}");
    });
  }
}
