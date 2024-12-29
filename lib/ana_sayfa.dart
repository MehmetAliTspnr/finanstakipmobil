import 'package:flutter/material.dart';
import 'gelir_gider_ekle.dart';
import 'kategori_islemler_sonuc.dart';

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Sayfa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GelirGiderEkle()),
                );
              },
              child: const Text('Gelir/Gider Ekle'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IslemlerSayfasi()),
                );
              },
              child: const Text('İşlemler'),
            ),
          ],
        ),
      ),
    );
  }
}