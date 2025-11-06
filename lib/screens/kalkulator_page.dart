// screens/kalkulator_page.dart

import 'package:flutter/material.dart';
import 'dart:math' as math; // Import library math untuk sqrt

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  // === VARIABEL STATE UNTUK LOGIKA KALKULATOR ===

  String _output = "0"; // Teks yang tampil di display
  double _num1 = 0; // Angka pertama yang disimpan
  String _operator = ""; // Operator yang sedang aktif (+, -, ×, ÷)
  bool _isWaitingForNum2 =
      false; // Flag untuk menandai apakah kita sedang menunggu angka kedua

  // === FUNGSI UTAMA PENGENDALI TOMBOL ===

  void _onButtonPressed(String buttonText) {
    setState(() {
      // 1. Tombol Angka (0-9 dan .)
      if ("0123456789.".contains(buttonText)) {
        _handleNumberInput(buttonText);
      }
      // 2. Tombol Operator Unary (langsung dieksekusi)
      else if (buttonText == "√" || buttonText == "x²") {
        _handleUnaryOperator(buttonText);
      }
      // 3. Tombol Clear (AC dan C)
      else if (buttonText == "AC") {
        _handleAc();
      } else if (buttonText == "C") {
        _handleBackspace();
      }
      // 4. Tombol Operator Binary (butuh 2 angka)
      else if ("+ - × ÷".contains(buttonText)) {
        _handleBinaryOperator(buttonText);
      }
      // 5. Tombol Equals (=)
      else if (buttonText == "=") {
        _handleEquals();
      }
    });
  }

  // === FUNGSI-FUNGSI PEMBANTU (LOGIKA) ===

  // Menangani input angka
  void _handleNumberInput(String numStr) {
    if (_isWaitingForNum2) {
      _output = numStr;
      _isWaitingForNum2 = false;
    } else {
      // Mencegah duplikasi titik desimal
      if (numStr == "." && _output.contains(".")) return;
      _output = (_output == "0") ? numStr : _output + numStr;
    }
  }

  // Menangani operator instan (Akar dan Kuadrat)
  void _handleUnaryOperator(String op) {
    double currentNum = double.parse(_output);
    double result = 0;

    if (op == "√") {
      if (currentNum < 0) {
        // Error handling untuk akar negatif
        _output = "Error";
        return;
      }
      result = math.sqrt(currentNum);
    } else if (op == "x²") {
      result = currentNum * currentNum;
    }
    _output = _formatOutput(result);
    _isWaitingForNum2 = false;
  }

  // Menangani operator +, -, ×, ÷
  void _handleBinaryOperator(String op) {
    // Jika ada operasi sebelumnya, hitung dulu
    if (_operator.isNotEmpty && !_isWaitingForNum2) {
      _handleEquals();
    }
    _num1 = double.parse(_output);
    _operator = op;
    _isWaitingForNum2 = true;
  }

  // Menangani tombol = (Equals)
  void _handleEquals() {
    if (_operator.isEmpty || _isWaitingForNum2) return;

    double num2 = double.parse(_output);
    double result = 0;

    switch (_operator) {
      case "+":
        result = _num1 + num2;
        break;
      case "-":
        result = _num1 - num2;
        break;
      case "×":
        result = _num1 * num2;
        break;
      case "÷":
        if (num2 == 0) {
          // Error handling untuk bagi dengan nol
          _output = "Error";
          _operator = "";
          return;
        }
        result = _num1 / num2;
        break;
    }

    _output = _formatOutput(result);
    _operator = "";
    _num1 = 0;
    _isWaitingForNum2 = false;
  }

  // Menangani tombol All Clear (AC)
  void _handleAc() {
    _output = "0";
    _num1 = 0;
    _operator = "";
    _isWaitingForNum2 = false;
  }

  // Menangani tombol Backspace (C)
  void _handleBackspace() {
    if (_isWaitingForNum2) return; // Jangan hapus jika sedang menunggu num2
    if (_output.length > 1) {
      _output = _output.substring(0, _output.length - 1);
    } else {
      _output = "0";
    }
  }

  // Helper untuk format output (menghilangkan .0 jika tidak perlu)
  String _formatOutput(double num) {
    if (num % 1 == 0) {
      return num.toInt().toString(); // Jadi "7"
    } else {
      return num.toString(); // Jadi "7.5"
    }
  }

  // === FUNGSI BUILD TAMPILAN (UI) ===

  @override
  Widget build(BuildContext context) {
    // Tetap HANYA return Column (tanpa Scaffold/AppBar)
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
                fontSize: _output.length > 10
                    ? 48
                    : 64, // Kecilkan font jika panjang
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
                // Daftar tombol (sudah diubah)
                _buildButton(
                  "AC", // All Clear
                  color: Colors.grey.shade400,
                  textColor: Colors.black,
                ),
                _buildButton(
                  "C", // Backspace
                  color: Colors.grey.shade400,
                  textColor: Colors.black,
                ),
                _buildButton(
                  "√", // TOMBOL BARU: Akar Kuadrat
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
                _buildButton(
                  "x²", // TOMBOL BARU: Kuadrat
                  color: Color(0xFFB4A9E7),
                ),
                _buildButton(
                  "=",
                  color: Color(0xFFB4A9E7), // Ungu
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Widget helper untuk membuat tombol (tidak berubah)
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
