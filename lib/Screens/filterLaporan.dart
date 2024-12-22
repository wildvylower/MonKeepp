import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:monkeep/Screens/laporanSaldo.dart';
import 'package:monkeep/Screens/laporanTransaksi.dart';
import 'package:monkeep/Screens/ringkasanLaporan.dart';
import 'package:monkeep/Screens/laporanHutang.dart';

class Filterlaporan extends StatelessWidget {
  final int currentIndex;

  // Constructor without `const`
  Filterlaporan({Key? key, required this.currentIndex}) : super(key: key);

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

  void navigateToPage(BuildContext context, int index) {
    if (index == currentIndex) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => filterPages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: filterNames.asMap().entries.map((entry) {
        final index = entry.key;
        final filterName = entry.value;
        final isActive = index == currentIndex;

        return GestureDetector(
          onTap: () => navigateToPage(context, index),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: isActive ? const Color(0xff4A63E2) : const Color(0xff808CFA),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: AutoSizeText(
              filterName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
              maxLines: 1,
              maxFontSize: 16,
              minFontSize: 10,
            ),
          ),
        );
      }).toList(),
    );
  }
}
