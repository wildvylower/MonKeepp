import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:monkeep/Screens/laporanSaldo.dart';
import 'package:monkeep/Screens/laporanTransaksi.dart';
import 'package:monkeep/Screens/ringkasanLaporan.dart';
import 'package:monkeep/Screens/laporanHutang.dart';

class FilterWrapper extends StatefulWidget {
  const FilterWrapper({Key? key}) : super(key: key);

  @override
  State<FilterWrapper> createState() => _FilterWrapperPageState();
}

class _FilterWrapperPageState extends State<FilterWrapper> {
  int currentIndex = 0;

  final List<String> filterNames = [
    "Saldo",
    "Transaksi",
    "Laporan",
    "Hutang Piutang",
  ];

  final List<Widget> filterPages = [
    LaporanSaldo(),
    LaporanTransaksi(),
    Ringkasanlaporan(),
    LaporanHutang(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            height: 90,
            decoration: const BoxDecoration(
              color: Color(0xFF4A63E2),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 35),
              child: AutoSizeText(
                'Laporan Keuangan',
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
            ),
          ),

          // FilterWrapper
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: Color(0xFFF3F4FE),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFilterButton("Saldo", 0),
                _buildFilterButton("Transaksi", 1),
                _buildFilterButton("Laporan", 2),
                _buildFilterButton("Hutang Piutang", 3),
              ],
            ),
          ),

          // Konten halaman filter
          Expanded(
            child: filterPages[currentIndex],
          ),
        ],
      ),
      ),
    );
  }

  // Tombol filter
  Widget _buildFilterButton(String label, int index) {
    final isActive = currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xff4A63E2) : const Color(0xff808CFA),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
