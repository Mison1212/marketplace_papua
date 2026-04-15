import 'package:flutter/material.dart';
import 'package:marketplace_papua/features/auth/widgets/custom_button.dart';
import 'package:marketplace_papua/features/catalog/catalog_page.dart';
import 'package:marketplace_papua/services/auth_service.dart';
import 'package:marketplace_papua/widgets/custom_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  Future<void> _showMessage(String message) async {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _register() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirm = _confirmController.text.trim();

    if (email.isEmpty || password.isEmpty || confirm.isEmpty) {
      _showMessage('Semua field harus diisi.');
      return;
    }
    if (password != confirm) {
      _showMessage('Password dan konfirmasi harus sama.');
      return;
    }
    if (password.length < 6) {
      _showMessage('Password minimal 6 karakter.');
      return;
    }

    setState(() => _isLoading = true);
    final user = await _authService.registerWithEmail(email, password);
    setState(() => _isLoading = false);

    if (user != null) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CatalogPage()),
      );
    } else {
      _showMessage('Registrasi gagal. Silakan coba lagi.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF06122B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF06122B),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Daftar Akun', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Buat akun baru untuk mulai jual dan beli produk Papua.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              CustomInput(label: 'Email', controller: _emailController),
              const SizedBox(height: 18),
              CustomInput(
                label: 'Password',
                controller: _passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 18),
              CustomInput(
                label: 'Konfirmasi Password',
                controller: _confirmController,
                isPassword: true,
              ),
              const SizedBox(height: 24),
              CustomButton(
                label: _isLoading ? 'Loading...' : 'Daftar Sekarang',
                onPressed: _isLoading ? null : _register,
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Sudah punya akun? Masuk',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
