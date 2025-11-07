// screens/dashboard.dart
import 'package:flutter/material.dart';
import '/screens/biodata_page.dart';
import '/screens/kalkulator_page.dart';
import '/screens/cuaca_page.dart';
import '/screens/kontak_page.dart';
import '/screens/berita_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Daftar semua halaman
  static const List<Widget> _widgetOptions = <Widget>[
    BiodataPage(),
    KalkulatorPage(),
    CuacaPage(),
    KontakPage(),
    BeritaPage(),
  ];

  // BUAT DAFTAR JUDUL UNTUK APPBAR
  static const List<String> _widgetTitles = <String>[
    "Profil Biodata",
    "Kalkulator",
    "Info Cuaca",
    "Kontak Teman",
    "Berita Terkini",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TAMBAHKAN APPBAR INI
      appBar: AppBar(
        title: Text(_widgetTitles.elementAt(_selectedIndex)),
        // Atur style AppBar di sini jika perlu
        backgroundColor: _selectedIndex == 2
            ? Color(0xFFE0F7FA)
            : Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: _selectedIndex == 2
            ? Colors.black87
            : Theme.of(context).appBarTheme.foregroundColor,
      ),

      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            activeIcon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny_outlined),
            activeIcon: Icon(Icons.wb_sunny),
            label: 'Cuaca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts_outlined),
            activeIcon: Icon(Icons.contacts),
            label: 'Kontak',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            activeIcon: Icon(Icons.article),
            label: 'Berita',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFBC6E1),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
