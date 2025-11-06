// screens/kalkulator_page.dart

import 'package:flutter/material.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String _output = "0";

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        _output = "0";
      } else if (buttonText == "C") {
        // Logika hapus (contoh sederhana)
        if (_output.length > 1) {
          _output = _output.substring(0, _output.length - 1);
        } else {
          _output = "0";
        }
      } else if (buttonText == "=") {
        // Logika perhitungan (bisa ditambahkan nanti)
        // Untuk saat ini, biarkan saja
      } else {
        if (_output == "0") {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold DAN AppBar dihapus.
    // Langsung return widget kontennya (Column).
    return Column(
      children: [
        // Bagian Tampilan Display
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            alignment: Alignment.bottomRight,
            child: Text(
              _output,
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),

        // Garis pemisah (sesuai UI)
        Divider(
          height: 1,
          color: Colors.grey.shade300,
          indent: 20,
          endIndent: 20,
        ),

        // Bagian Tombol-tombol
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                // Daftar tombol
                _buildButton(
                  "AC",
                  color: Colors.grey.shade400,
                  textColor: Colors.black,
                ),
                _buildButton(
                  "C",
                  color: Colors.grey.shade400,
                  textColor: Colors.black,
                ),
                _buildButton(
                  "%",
                  color: Colors.grey.shade400,
                  textColor: Colors.black,
                ),
                _buildButton("÷", color: Color(0xFFFBC6E1)), // Pink

                _buildButton("7"),
                _buildButton("8"),
                _buildButton("9"),
                _buildButton("×", color: Color(0xFFFBC6E1)), // Pink

                _buildButton("4"),
                _buildButton("5"),
                _buildButton("6"),
                _buildButton("-", color: Color(0xFFFBC6E1)), // Pink

                _buildButton("1"),
                _buildButton("2"),
                _buildButton("3"),
                _buildButton("+", color: Color(0xFFFBC6E1)), // Pink

                _buildButton("."), // Tombol titik
                _buildButton("0"),
                _buildButton("00"), // Tombol 00
                _buildButton("=", color: Color(0xFFB4A9E7)), // Ungu
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Widget helper untuk membuat tombol
  Widget _buildButton(
    String text, {
    Color color = Colors.white,
    Color textColor = Colors.black,
  }) {
    return ElevatedButton(
      onPressed: () => _onButtonPressed(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 2.0,
        shadowColor: Colors.grey.withOpacity(0.2),
        textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      child: Text(text),
    );
  }
}
