import 'package:intl/intl.dart';

class Tabungan {
  final String name;        // Nama aplikasi (misalnya, Gopay, OVO)
  final double amount;      // Jumlah transaksi 
  final double target;          // Kategori (Income atau Expense)
  final String dateline;    // Kategori transaksi (misalnya, Makanan, Transportasi)

  Tabungan({
    required this.name,
    required this.amount,
    required this.target,
    required this.dateline,
  });

  // Fungsi untuk membuat objek Add_data dari JSON (untuk pengintegrasian nanti)
  // factory Add_data.fromJson(Map<String, dynamic> json) {
  //   return Add_data(
  //     name: json['name'],
  //     amount: json['amount'],
  //     datetime: DateTime.parse(json['datetime']),
  //     IN: json['IN'],
  //     category: json['category'],
  //     icon: json['icon'],
  //   );
  // }

   DateTime get deadlineDate {
    return DateFormat('d MMMM yyyy', 'id_ID').parse(dateline);
  }
}



final List<Tabungan> dummyTransactions = [
  Tabungan(
    name: 'Mau Beli Rumah',
    amount: 1000000000, // Angka tanpa format pemisah
    target: 100000000000,
    dateline: '20 Januari 2026',
  ),
  Tabungan(
    name: 'Beli Album BTS',
    amount: 500000,
    target: 800000,
    dateline: '5 Januari 2025',
  ),
  Tabungan(
    name: 'Beli Tab',
    amount: 2000000,
    target: 5000000,
    dateline: '20 Juli 2025',
  ),
  Tabungan(
    name: 'Ultah cipcip',
    amount: 200000,
    target: 600000,
    dateline: '3 Oktober 2025',
  ),
];
