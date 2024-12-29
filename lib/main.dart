import 'package:flutter/material.dart';
import 'login_giris.dart';
import 'ana_sayfa.dart';

// Gelir/Gider işlemlerinin tutulacağı global liste
List<Map<String, dynamic>> islemlerListesi = [];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finans Takip Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(), // Giriş ekranı
    );
  }
}