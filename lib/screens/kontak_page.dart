// screens/kontak_page.dart

import 'package:flutter/material.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  // Data dummy kontak
  final List<Map<String, String>> kontakList = const [
    {
      "nama": "Alice",
      "nomor": "0899-1234-5678",
      "img": "https://i.pravatar.cc/150?img=25",
    },
    {
      "nama": "Bryan",
      "nomor": "0891-120B-5322",
      "img": "https://i.pravatar.cc/150?img=12",
    },
    {
      "nama": "Cindy",
      "nomor": "0855-1336-13882",
      "img": "https://i.pravatar.cc/150?img=31",
    },
    {
      "nama": "Dani",
      "nomor": "0899-1323-5302",
      "img": "https://i.pravatar.cc/150?img=14",
    },
    {
      "nama": "Emma",
      "nomor": "0899-1324-10151",
      "img": "https://i.pravatar.cc/150?img=47",
    },
    {
      "nama": "Florence",
      "nomor": "0899-1324-5323",
      "img": "https://i.pravatar.cc/150?img=49",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Scaffold DAN AppBar dihapus.
    // Langsung return widget kontennya (ListView).
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      itemCount: kontakList.length,
      itemBuilder: (context, index) {
        final kontak = kontakList[index];
        return Card(
          elevation: 2.0,
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
            ),
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(kontak["img"]!),
            ),
            title: Text(
              kontak["nama"]!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              kontak["nomor"]!,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
        );
      },
    );
  }
}
