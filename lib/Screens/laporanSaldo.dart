import 'package:flutter/material.dart';
import 'package:monkeep/models/saldo.dart'; // Pastikan ini terhubung dengan file data dummy
import 'package:monkeep/Screens/filterLaporan.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LaporanSaldo extends StatelessWidget {
  const LaporanSaldo({super.key});

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
                    color: const Color(0xFF4A63E2),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 35),
                      child: Text(
                        'Laporan Keuangan',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    width: double.infinity,
                    child: 
                      Filterlaporan(currentIndex: 0),
                  ),),

                  

                  // Header Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AutoSizeText(
                      'Saldo',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxFontSize: 24,
                      minFontSize: 14,
                    ),
                  ),

                  // List Saldo
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: saldo.map((item) {
                        final incomeRatio = item.income / (item.income + item.expense);
                        final expenseRatio = item.expense / (item.income + item.expense);

                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // E-Wallet Name and Icon
                                Row(
                                  children: [
                                    Image.asset(
                                      item.icon,
                                      width: 28,
                                      height: 28,
                                    ),
                                    const SizedBox(width: 8),
                                    AutoSizeText(
                                      item.wallet,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      maxFontSize: 18,
                                      minFontSize: 12,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),

                                // Balance
                                AutoSizeText(
                                  item.formattedBalance,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  minFontSize: 16,
                                ),

                                const SizedBox(height: 8),

                                // Pemasukan
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const AutoSizeText(
                                      'Pemasukan Bulan Ini',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                      maxLines: 1,
                                      maxFontSize: 14,
                                      minFontSize: 10,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: _buildProgressBar(
                                            ratio: incomeRatio,
                                            color: Color(0xffC5BAFC),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        AutoSizeText(
                                          item.formattedIncome,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          maxFontSize: 14,
                                          minFontSize: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 8),

                                // Pengeluaran
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Pengeluaran Bulan Ini',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: _buildProgressBar(
                                            ratio: expenseRatio,
                                            color: Color(0xff808CFA),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        AutoSizeText(
                                          item.formattedExpense,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          maxFontSize: 14,
                                          minFontSize: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
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

  Widget _buildProgressBar({required double ratio, required Color color}) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: Color(0xffF3F4FE),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Color(0xffD9D9D9),
        ),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: ratio, // Adjust the width based on ratio
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
