import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({super.key});

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
                          const FaIcon(
                            FontAwesomeIcons.chevronLeft,
                            color: Colors.white,
                            size: 24,
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
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Container(
                      width: 362,
                      height: 362,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                            onTap: () {
                              // Add camera logic here
                            },
                            child: const Icon(
                              FontAwesomeIcons.camera,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const AutoSizeText(
                            'Pindai Transaksi',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            maxLines: 1,
                            maxFontSize: 16,
                            minFontSize: 12,
                          ),
                          const SizedBox(height: 8),
                          TextButton.icon(
                            onPressed: () {}, // Add upload logic here
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
                  ),

                  // Form Fields
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Dropdown for Expense or Income
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Jenis Transaksi',
                            labelStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'Pengeluaran',
                              child: Text('Pengeluaran'),
                            ),
                            DropdownMenuItem(
                              value: 'Pemasukan',
                              child: Text('Pemasukan'),
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 16),

                        // Category Dropdown
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Kategori',
                            labelStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'Makanan',
                              child: Text('Makanan'),
                            ),
                            DropdownMenuItem(
                              value: 'Transportasi',
                              child: Text('Transportasi'),
                            ),
                            DropdownMenuItem(
                              value: 'Sewa',
                              child: Text('Sewa'),
                            ),
                            DropdownMenuItem(
                              value: 'Belanja',
                              child: Text('Belanja'),
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 16),

                        // Amount Input
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Jumlah',
                            prefixText: 'Rp ',
                            labelStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16),

                        // Description Input
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Keterangan',
                            labelStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Account Dropdown
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Rekening',
                            labelStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'BCA',
                              child: Text('BCA'),
                            ),
                            DropdownMenuItem(
                              value: 'ShopeePay',
                              child: Text('ShopeePay'),
                            ),
                            DropdownMenuItem(
                              value: 'GoPay',
                              child: Text('GoPay'),
                            ),
                            DropdownMenuItem(
                              value: 'OVO',
                              child: Text('OVO'),
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 16),

                        // Date Picker
                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Tanggal',
                            suffixIcon: const Icon(Icons.calendar_today),
                            labelStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
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
                        const SizedBox(height: 24),

                        // Submit Button
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Add save logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4A63E2),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16),
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
