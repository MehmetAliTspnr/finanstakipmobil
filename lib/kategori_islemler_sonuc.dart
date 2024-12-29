import 'package:flutter/material.dart';
import 'main.dart';

class IslemlerSayfasi extends StatelessWidget {
  const IslemlerSayfasi({super.key});

  // Gelir ve gider toplamlarını hesaplama
  Map<String, double> _hesaplaToplamlar() {
    double toplamGelir = 0;
    double toplamGider = 0;

    for (var islem in islemlerListesi) {
      if (islem['kategori'] == 'Maaş Geliri' ||
          islem['kategori'] == 'Kira Geliri' ||
          islem['kategori'] == 'Yatırım Geliri') {
        toplamGelir += islem['miktar'];
      } else {
        toplamGider += islem['miktar'];
      }
    }

    return {
      'toplamGelir': toplamGelir,
      'toplamGider': toplamGider,
      'toplamBakiye': toplamGelir - toplamGider,
    };
  }

  @override
  Widget build(BuildContext context) {
    final toplamlar = _hesaplaToplamlar();

    return Scaffold(
      appBar: AppBar(
        title: const Text('İşlemler'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Toplam Gelir, Gider ve Bütçe Durumu
          Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Toplam Gelir: ₺${toplamlar['toplamGelir']!.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, color: Colors.green),
                  ),
                  Text(
                    'Toplam Gider: ₺${toplamlar['toplamGider']!.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Toplam Bütçe: ₺${toplamlar['toplamBakiye']!.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: toplamlar['toplamBakiye']! >= 0
                          ? Colors.blue
                          : Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // İşlemler Listesi
          Expanded(
            child: ListView.builder(
              itemCount: islemlerListesi.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 8.0),
                  child: ListTile(
                    title: Text('Kategori: ${islemlerListesi[index]['kategori']}'),
                    subtitle: Text(
                      'Miktar: ₺${islemlerListesi[index]['miktar'].toStringAsFixed(2)}',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}