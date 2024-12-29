import 'package:flutter/material.dart';
import 'ana_sayfa.dart'; // Ana sayfa sayfasını dahil ettim

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == "admin" && password == "1234") {
      // Başarılı girişte, ana sayfaya geçiş yapalım
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Giriş Başarılı! Hoşgeldiniz.')),
      );

      // Navigator.pushReplacement ile login ekranını kapatıp ana sayfaya yönlendirdim
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AnaSayfa()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hatalı Kullanıcı Adı veya Şifre')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giriş Yap'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adı',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
}