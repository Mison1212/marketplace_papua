import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:marketplace_papua/features/auth/login_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() {
    // Memberi jeda 3 detik agar logo splash terlihat
    Timer(const Duration(seconds: 3), () {
      // Mengecek apakah ada user yang sudah login di Firebase [cite: 18]
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Sementara ke Scaffold kosong dulu sebelum fitur catalog siap
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const Scaffold(body: Center(child: Text("Halaman Catalog"))),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100), // Ganti dengan logo marketplace Anda nanti
            SizedBox(height: 20),
            Text(
              "Marketplace Papua",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
