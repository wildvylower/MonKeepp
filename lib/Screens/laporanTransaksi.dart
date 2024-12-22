// Import statements
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:monkeep/models/data.dart'; // Pastikan ini terhubung dengan file data dummy
import 'package:monkeep/Screens/filterLaporan.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LaporanTransaksi extends StatefulWidget {
  const LaporanTransaksi({super.key});
  @override
  _LaporanTransaksiState createState() => _LaporanTransaksiState();
}

class _LaporanTransaksiState extends State<LaporanTransaksi> {
  // Initial value for dropdown
  String? selectedCategory = 'Pengeluaran';
  String? selectedMonth = 'Desember';

  // List of items for the dropdown
  List<String> categoryItems = ['Pengeluaran', 'Pemasukan'];
  List<String> monthItems = [
    'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 
    'Agustus', 'September', 'Oktober', 'November', 'Desember'
  ];

  final AutoSizeGroup containerTransaction = AutoSizeGroup();

  // Filter logic
  List<Add_data> getFilteredTransactions() {
    return dummyTransactions.where((transaction) {
      final matchesCategory = transaction.category == selectedCategory;
      final matchesMonth = transaction.date.contains(selectedMonth ?? '');
      return matchesCategory && matchesMonth;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4FE),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                // Header
                Container(
                  width: double.infinity,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Color(0xFF4A63E2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
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

                // Filter bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      AutoSizeText(
                        'Filter:',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Color(0xff4A63E2),
                        ),
                        maxLines: 1,
                        maxFontSize: 16,
                        minFontSize: 10,
                      ),
                      SizedBox(width: 8),
                      DropdownButton<String>(
                        dropdownColor: Colors.white,
                        value: selectedCategory,
                        icon: Icon(
                          FontAwesomeIcons.chevronDown,
                          color: Color(0xff808CFA),
                          size: 20,
                        ),
                        elevation: 8,
                        borderRadius: BorderRadius.circular(10),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Color(0xff808CFA),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCategory = newValue!;
                          });
                        },
                        items: categoryItems.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: AutoSizeText(
                              value,
                              maxLines: 1,
                              maxFontSize: 16,
                              minFontSize: 12,
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(width: 8),
                      DropdownButton<String>(
                        dropdownColor: Colors.white,
                        value: selectedMonth,
                        icon: Icon(
                          FontAwesomeIcons.chevronDown,
                          color: Color(0xff808CFA),
                          size: 20,
                        ),
                        elevation: 8,
                        borderRadius: BorderRadius.circular(10),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Color(0xff808CFA),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedMonth = newValue!;
                          });
                        },
                        items: monthItems.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: AutoSizeText(
                              value,
                              maxLines: 1,
                              maxFontSize: 16,
                              minFontSize: 12,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),

                // Transaction list
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: getFilteredTransactions().map((transaction) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: buildTransactionTile(transaction),
                      );
                    }).toList(),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Container buildTransactionTile(Add_data history) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Leading icon
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              'images/${history.icon}',
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),

          // Middle section with name and description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  history.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  maxFontSize: 20,
                  minFontSize: 14,
                ),
                SizedBox(height: 4),
                AutoSizeText(
                  '${history.description}',
                  group: containerTransaction,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4A63E2),
                  ),
                  maxLines: 2,
                  maxFontSize: 18,
                  minFontSize: 12,
                ),
              ],
            ),
          ),
          SizedBox(width: 60),

          // Right-aligned amount
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AutoSizeText(
                history.category,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: history.category == 'Pemasukan'
                      ? Color(0xFF4A63E2)
                      : Color(0xFF808CFA),
                ),
                maxLines: 1,
                maxFontSize: 18,
                minFontSize: 12,
              ),
              SizedBox(height: 4),
              AutoSizeText(
                history.amount,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
                maxLines: 1,
                maxFontSize: 20,
                minFontSize: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
