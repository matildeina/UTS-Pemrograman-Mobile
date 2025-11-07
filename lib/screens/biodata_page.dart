// screens/biodata_page.dart

import 'package:flutter/material.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  String? _jenisKelamin;
  String? _programStudi = "Teknik Informatika";
  DateTime? _tanggalLahir;
  final TextEditingController _dateController = TextEditingController();

  void _pilihTanggal() async {
    // ... (FUNGSI _pilihTanggal SAMA SEPERTI SEBELUMNYA, TIDAK BERUBAH)
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _tanggalLahir ?? DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFFFBC6E1),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Color(0xFFFBC6E1)),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != _tanggalLahir) {
      setState(() {
        _tanggalLahir = pickedDate;
        _dateController.text =
            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // HAPUS 'Scaffold' DAN 'AppBar' DARI SINI
    // Langsung return widget kontennya
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Container(
              width: 120, // 2x radius (60 * 2)
              height: 120, // 2x radius (60 * 2)
              decoration: BoxDecoration(
                color: Colors.grey.shade200, // Warna background yang sama
                shape: BoxShape.circle, // Bikin jadi lingkaran
                image: DecorationImage(
                  image: AssetImage('assets/profile.jpg'),

                  // Gunakan 'BoxFit.cover' (sama seperti default CircleAvatar)
                  fit: BoxFit.cover,

                  // --- INI BAGIAN PENTINGNYA ---
                  // Ambil gambar dari bagian tengah-atas, bukan tengah-tengah
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SizedBox(height: 32),
            _buildTextField(
              label: "Nama Lengkap",
              hint: "Matilde the Ola basinaeng",
            ),
            SizedBox(height: 20),
            Text(
              "Jenis Kelamin",
              style: TextStyle(color: Colors.grey.shade600),
            ),
            Row(
              children: [
                Expanded(child: _buildRadio("Perempuan")),
                Expanded(child: _buildRadio("Laki-laki")),
              ],
            ),
            SizedBox(height: 20),
            _buildTextField(
              label: "Pilih Tanggal Lahir",
              hint: "TT-BB-TTTT",
              controller: _dateController,
              readOnly: true,
              onTap: _pilihTanggal,
              icon: Icons.calendar_today,
            ),
            SizedBox(height: 20),
            Text(
              "Program Studi",
              style: TextStyle(color: Colors.grey.shade600),
            ),
            SizedBox(height: 8),
            _buildDropdown(),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFBC6E1),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Simpan",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ... (SISA KODE _buildRadio, _buildDropdown, _buildTextField SAMA PERSIS)
  // ...
  // Widget helper untuk Radio Button
  Widget _buildRadio(String value) {
    return RadioListTile<String>(
      title: Text(value),
      value: value,
      groupValue: _jenisKelamin,
      onChanged: (String? newValue) {
        setState(() {
          _jenisKelamin = newValue;
        });
      },
      activeColor: Color(0xFFFBC6E1),
      contentPadding: EdgeInsets.zero,
    );
  }

  // Widget helper untuk Dropdown
  Widget _buildDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _programStudi,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down, color: Color(0xFFFBC6E1)),
          items:
              [
                "Teknik Informatika",
                "Sistem Informasi",
                "Desain Grafis",
                "Manajemen Bisnis",
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _programStudi = newValue;
            });
          },
        ),
      ),
    );
  }

  // Widget helper untuk TextFormField
  Widget _buildTextField({
    required String label,
    required String hint,
    IconData? icon,
    TextEditingController? controller,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey.shade600)),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            suffixIcon: icon != null
                ? Icon(icon, color: Color(0xFFFBC6E1))
                : null,
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Color(0xFFFBC6E1), width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
