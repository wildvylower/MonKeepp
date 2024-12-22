import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:monkeep/models/database_service.dart';

class AddTransaction extends StatelessWidget {
  // const AddTransaction({super.key});

  final ImagePicker _picker = ImagePicker();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController keteranganController = TextEditingController();
  String? kategoriValue = "Pemasukan";
  String? rekeningValue = "BCA";
  final _dbservice = DatabaseService();

  Future<void> scanReceipt(BuildContext context) async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        // Kirim gambar ke backend
        await sendImageToBackend(context, image.path);
        print("Image has been sent");
      } else {
        print("No image captured");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> uploadReceipt(BuildContext context) async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        // Kirim gambar ke backend
        await sendImageToBackend(context, image.path);
        print("Image has been sent");
      } else {
        print("No image captured");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> sendImageToBackend(
      BuildContext context, String imagePath) async {
    final uri = Uri.parse('http://localhost:8000/process-receipt');
    final request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('image', imagePath));

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final result = json.decode(responseBody);

      if (result != null) {
        final jumlah = result['total'];
        final keterangan = result['judul_struk'];

        // Masukkan hasil ke text field di Flutter
        jumlahController.text = jumlah;
        keteranganController.text = keterangan;

        print('Jumlah: $jumlah, Keterangan: $keterangan');
      }
    } else {
      print("Failed to process receipt: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4FE),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  // Header
                  Container(
                    width: double.infinity,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Color(0xFF4A63E2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.chevronLeft,
                              color: Colors.white,
                              size: 24,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(width: 16),
                          const AutoSizeText(
                            'Tambah Catatan Keuangan',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            maxFontSize: 24,
                            minFontSize: 14,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Image Container
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Container(
                      width: 362,
                      height: 362,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 4,
                            spreadRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => scanReceipt(context), //camera logic
                            child: const Icon(
                              FontAwesomeIcons.camera,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const AutoSizeText(
                            'Pindai Transaksi',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            maxFontSize: 16,
                            minFontSize: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            uploadReceipt(context);
                          }, // Add upload logic here
                          icon: const FaIcon(
                            FontAwesomeIcons.upload,
                            color: Color(0xFF4A63E2),
                            size: 16,
                          ),
                          label: const Text(
                            'Unggah Gambar',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: Color(0xFF4A63E2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Form Fields
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Dropdown for Expense or Income
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              labelText: 'Jenis Transaksi',
                              labelStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide
                                    .none, // Remove border since shadow is used
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                  value: 'Pengeluaran',
                                  child: Text('Pengeluaran')),
                              DropdownMenuItem(
                                  value: 'Pemasukan', child: Text('Pemasukan')),
                            ],
                            onChanged: (value) {
                              kategoriValue = value;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Category Dropdown
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              labelText: 'Kategori',
                              labelStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                  value: 'Makanan', child: Text('Makanan')),
                              DropdownMenuItem(
                                  value: 'Transportasi',
                                  child: Text('Transportasi')),
                              DropdownMenuItem(
                                  value: 'Sewa', child: Text('Sewa')),
                              DropdownMenuItem(
                                  value: 'Belanja', child: Text('Belanja')),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Amount Input
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: jumlahController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              labelText: 'Jumlah',
                              prefixText: 'Rp ',
                              labelStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Description Input
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: keteranganController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              labelText: 'Keterangan',
                              labelStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Account Dropdown
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              labelText: 'Rekening',
                              labelStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                  value: 'BCA', child: Text('BCA')),
                              DropdownMenuItem(
                                  value: 'ShopeePay', child: Text('ShopeePay')),
                              DropdownMenuItem(
                                  value: 'GoPay', child: Text('GoPay')),
                              DropdownMenuItem(
                                  value: 'OVO', child: Text('OVO')),
                            ],
                            onChanged: (value) {
                              rekeningValue = value;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Date Picker
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              labelText: 'Tanggal',
                              suffixIcon: const Icon(Icons.calendar_today),
                              labelStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Submit Button
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              final transaction = MyTransaction(
                                  kategori: kategoriValue,
                                  jumlah: int.parse(jumlahController.text),
                                  keterangan: keteranganController.text,
                                  rekening: rekeningValue);
                              _dbservice.create(transaction);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4A63E2),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Buat Catatan',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTransaction {
  final String? kategori;
  final int jumlah;
  final String keterangan;
  final String? rekening;

  MyTransaction(
      {required this.kategori,
      required this.jumlah,
      required this.keterangan,
      required this.rekening});

  Map<String, dynamic> toMap() => {
        "kategori": kategori,
        "jumlah": jumlah,
        "keterangan": keterangan,
        "rekening": rekening
      };
}
