import 'package:flutter/material.dart';
import 'login_page.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_input.dart';
import '../../../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Marketplace")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomInput(label: "Email", controller: _emailController),
            const SizedBox(height: 15),
            CustomInput(label: "Password", controller: _passwordController, isPassword: true),
            const SizedBox(height: 25),
            // Tombol Login Email [cite: 57]
            CustomButton(
              label: "Login Email",
              onPressed: () async {
                var user = await _authService.loginWithEmail(
                    _emailController.text, _passwordController.text);
                if (user != null) {
                  // Navigasi ke Catalog (Akan dibuat di step berikutnya)
                }
              },
            ),
            const SizedBox(height: 10),
            // Tombol Login Google [cite: 58]
            CustomButton(
              label: "Login with Google",
              color: Colors.red,
              onPressed: () async {
                var user = await _authService.signInWithGoogle();
                if (user != null) {
                  // Navigasi ke Catalog
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}