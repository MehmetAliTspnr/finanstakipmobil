import 'package:flutter/material.dart';
import 'main.dart';

class GelirGiderEkle extends StatefulWidget {
  const GelirGiderEkle({super.key});

  @override
  State<GelirGiderEkle> createState() => _GelirGiderEkleState();
}

class _GelirGiderEkleState extends State<GelirGiderEkle> {
  String? selectedType;
  final TextEditingController miktarController = TextEditingController();

  void _islemEkle() {
    double miktar = double.tryParse(miktarController.text) ?? 0;

    if (selectedType != null && miktar > 0) {
      setState(() {
        // Yeni işlemi listeye ekleme
        islemlerListesi.add({
          'kategori': selectedType,
          'miktar': miktar,
        });

        // Girişleri sıfırlama
        selectedType = null;
        miktarController.clear();
      });

      // Kullanıcıya bilgi mesajı gönderme
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('İşlem başarıyla eklendi!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gelir/Gider Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedType,
              hint: const Text('Gelir/Gider Türü Seçin'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedType = newValue;
                });
              },
              items: <String>[
                'Maaş Geliri',
                'Kira Geliri',
                'Yatırım Geliri',
                'Ev Giderleri',
                'Benzin Giderleri',
                'Ek Giderler'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: miktarController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Miktar',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _islemEkle,
              child: const Text('Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}