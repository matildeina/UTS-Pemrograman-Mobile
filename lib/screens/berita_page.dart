// screens/berita_page.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  // 1. DATA DUMMY (STATIS)
  // Ini adalah "data" yang akan mengisi pola berulang kita.
  final List<Map<String, String>> beritaList = const [
    {
      "title": "Mahasiswa Kembangkan Aplikasi Deteksi Hoaks Berbasis AI",
      "category": "Teknologi",
      "date": "7 November 2025",
      "image": "https://picsum.photos/seed/berita1/600/400",
    },
    {
      "title": "Flutter 4.0 Diumumkan: Apa yang Baru untuk Developer?",
      "category": "Pemrograman",
      "date": "6 November 2025",
      "image": "https://picsum.photos/seed/berita2/600/400",
    },
    {
      "title": "Tips Produktif Kuliah Sambil Bekerja Part-Time",
      "category": "Gaya Hidup",
      "date": "5 November 2025",
      "image": "https://picsum.photos/seed/berita3/600/400",
    },
    {
      "title": "Tim Basket Kampus Lolos ke Final Nasional",
      "category": "Olahraga",
      "date": "4 November 2025",
      "image": "https://picsum.photos/seed/berita4/600/400",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // 2. HAPUS SCAFFOLD DAN APPBAR
    // Langsung return widget utamanya, yaitu ListView.builder
    // ListView.builder secara otomatis membuat "pola berulang"
    // berdasarkan data yang kita berikan.

    return ListView.builder(
      // Beri padding di sekitar list
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      itemCount: beritaList.length, // Berapa kali polanya diulang
      itemBuilder: (context, index) {
        // Ambil data untuk item ini
        final berita = beritaList[index];

        // 3. INI ADALAH "POLA" TAMPILANNYA
        // Kita gunakan Card agar terlihat rapi dan terpisah.
        // Setiap Card akan memiliki tampilan yang sama.
        return Card(
          margin: const EdgeInsets.only(bottom: 20.0), // Jarak antar Card
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          // clipBehavior memastikan gambar di dalamnya ikut terpotong rounded
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BAGIAN 1: GAMBAR
              Image.network(
                berita['image']!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                // Tampilkan loading indicator saat gambar dimuat
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 180,
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFFBC6E1), // Warna pink
                      ),
                    ),
                  );
                },
              ),

              // BAGIAN 2: TEKS (Judul, Kategori, Tanggal)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Kategori
                    Text(
                      berita['category']!,
                      style: GoogleFonts.poppins(
                        color: Color(0xFFFBC6E1), // Sesuai tema pink
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Judul Berita
                    Text(
                      berita['title']!,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                      maxLines: 2, // Batasi 2 baris
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 12),

                    // Tanggal
                    Text(
                      berita['date']!,
                      style: GoogleFonts.poppins(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
