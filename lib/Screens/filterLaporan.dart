import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:monkeep/Screens/laporanSaldo.dart';
import 'package:monkeep/Screens/laporanTransaksi.dart';
import 'package:monkeep/Screens/ringkasanLaporan.dart';
import 'package:monkeep/Screens/laporanHutang.dart';

class Filterlaporan extends StatefulWidget {
  const Filterlaporan({Key? key}) : super(key: key);

  @override
  State<Filterlaporan> createState() => _FilterlaporanState();
}

class _FilterlaporanState extends State<Filterlaporan> {
  int indexColor = 0;

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

  void _setActiveIndex(int index) {
    setState(() {
      indexColor = index;
    });

    
    Navigator.push(
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
        final isActive = index == indexColor;

        return GestureDetector(
          onTap: () {
            _setActiveIndex(index); 
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: EdgeInsets.symmetric(vertical : 10),
            decoration: BoxDecoration(
              color: isActive ? Color(0xff4A63E2) : Color(0xff808CFA),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: AutoSizeText(
              filterName,
              style: TextStyle(
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
