// screens/cuaca_page.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CuacaPage extends StatelessWidget {
  const CuacaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Kita gunakan Container dengan gradient sebagai background
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFB2EBF2), // Biru muda di atas
            Color(0xFFE0F7FA), // Biru lebih muda di bawah
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      // SingleChildScrollView agar aman di layar kecil
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1. Lokasi
              Text(
                "Surabaya",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 16),

              // 2. Ikon Cuaca Utama
              Icon(
                Icons.wb_cloudy_outlined, // Sesuai "Cerah Berawan"
                size: 120,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              SizedBox(height: 8),

              // 3. Suhu Utama
              Text(
                "27°C",
                style: GoogleFonts.poppins(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.75),
                ),
              ),
              SizedBox(height: 8),

              // 4. Status Cuaca
              Text(
                "Cerah Berawan",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              SizedBox(height: 8),

              // 5. Suhu Terasa
              Text(
                "Terasa seperti 29°C",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              SizedBox(height: 40),

              // 6. Kartu Detail (Kelembapan, Angin, dll)
              _buildInfoDetailCard(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget private untuk membuat kartu detail
  Widget _buildInfoDetailCard() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3), // Efek transparan
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInfoColumn(Icons.water_drop_outlined, "Kelembapan", "75%"),
          _buildInfoColumn(Icons.air, "Angin", "10 km/j"),
          _buildInfoColumn(Icons.umbrella_outlined, "Peluang Hujan", "20%"),
        ],
      ),
    );
  }

  // Widget private untuk membuat setiap item di kartu detail
  Widget _buildInfoColumn(IconData icon, String title, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.black.withOpacity(0.6), size: 28),
        SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
