import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monkeep/models/tabungan.dart';
import 'package:intl/intl.dart';

class Tabunganberencana extends StatefulWidget {
  const Tabunganberencana({Key? key}) : super(key: key);

  @override
  State<Tabunganberencana> createState() => _TabunganBerencanaState();
}

class _TabunganBerencanaState extends State<Tabunganberencana> {
  // Menggunakan copy dari dummyTransactions untuk memungkinkan modifikasi
  final List<Tabungan> data = List.from(dummyTransactions);

  final AutoSizeGroup containerTransaction = AutoSizeGroup();

  // Fungsi untuk memformat angka ke format Rupiah dengan titik sebagai pemisah ribuan
  String formatCurrency(double value) {
    final NumberFormat formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4FE),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
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
                      'Tabungan Berencana',
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

                // Daftar Tabungan
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    children: data.map((transaction) {
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

 Container buildTransactionTile(Tabungan history) {
  // Hitung progres tabungan
  double progress = history.amount / history.target;
  if (progress > 1.0) progress = 1.0;

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
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Bagian Kiri: Gambar Tabungan
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            'images/tabungan.png',
            height: 70,
            width: 90,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 5),

        // Bagian Kanan: Nama, Chevron, Ikon, Jumlah, dan Progress
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Baris Pertama: Nama, Chevron Right, dan Ikon
              Row(
                children: [
                  // Nama Tabungan
                   AutoSizeText(
                      history.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      maxFontSize: 16,
                      minFontSize: 12,
                    ),
                  
                  // Chevron Right
                  const Icon(
                    Icons.chevron_right,
                    color: Color(0xff4A63E2),
                  ),
                  const Spacer(),
                  // Ikon Pencil
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.pencil,
                      color: Color(0xff4A63E2),
                      size: 20,
                    ),
                    onPressed: () {
                      // Logika untuk mengedit tabungan
                    },
                  ),
                  // Ikon Trashcan
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.trashCan,
                      color: Color(0xff4A63E2),
                      size: 20,
                    ),
                    onPressed: () {
                      // Logika untuk menghapus tabungan
                    },
                  ),
                ],
              ),

              // Baris Kedua: Jumlah Tabungan dan Progress Bar
              AutoSizeText(
                formatCurrency(history.amount),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
                maxLines: 1,
                maxFontSize: 16,
                minFontSize: 12,
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20, // Tinggi progress bar
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffD9D9D9), // Warna border
                        width: 2, // Ketebalan border
                      ),
                      color: const Color(0xffF3F4FE), // Warna latar belakang
                    ),
                    child: ClipRRect(
                      child: LinearProgressIndicator(
                        value: progress,
                        color: const Color(0xff4A63E2),
                        backgroundColor: Colors.transparent, // Warna transparan agar hanya border yang terlihat
                        minHeight: 12, // Menyesuaikan dengan tinggi container
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  AutoSizeText(
                    'Ditabung ${(progress * 100).toStringAsFixed(1)}%',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xff4A63E2),
                    ),
                    maxLines: 1,
                    maxFontSize: 14,
                    minFontSize: 10,
                  ),
                ],
              )
            ],
        ),
        ),
      ],
    ),
  );
}

  
}
