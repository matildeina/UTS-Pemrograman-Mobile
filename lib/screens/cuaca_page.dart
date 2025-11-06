// screens/cuaca_page.dart

import 'package:flutter/material.dart';

class CuacaPage extends StatelessWidget {
  const CuacaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold dan backgroundColor DIHAPUS.
    // Langsung return widget kontennya (Center).
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Info Cuaca Hari Ini",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 32),

            // Ikon Matahari
            Icon(Icons.wb_sunny, size: 100, color: Colors.orange),
            SizedBox(height: 32),

            // Suhu
            Text(
              "27°C",
              style: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),

            // Lokasi
            Text(
              "Surabaya",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 8),

            // Status
            Text(
              "Cerah Berawan",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
