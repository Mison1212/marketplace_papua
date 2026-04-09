import 'package:flutter/material.dart';
import 'package:marketplace_papua/features/auth/splash_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Pastikan binding framework sudah siap
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace Papua',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      // Kita akan ganti Home dengan Splash Screen di langkah berikutnya
      home: const SplashScreen(),
    );
  }
}
