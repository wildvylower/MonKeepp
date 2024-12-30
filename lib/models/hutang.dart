class Hutang {
  final String name;        // Nama aplikasi (misalnya, Gopay, OVO)
  final String amount;      // Jumlah transaksi 
  final String description;          // Kategori (Income atau Expense)
  final String category;    // Kategori transaksi (misalnya, Makanan, Transportasi)
  final String dateline;   
  final String date;     // Nama file icon aplikasi yang akan ditampilkan

  Hutang({
    required this.name,
    required this.amount,
    required this.description,
    required this.category,
    required this.dateline,
    required this.date,
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
}

final List<Hutang> dummyTransactions = [
  Hutang(
    name: 'Bu Ana Deket Musholla',
    amount: 'Rp 700.000',
    description: 'Beli Blender',
    category: 'Hutang',
    dateline: 'Lunas',
    date : '12 Desember 2024'
  ),
  Hutang(
    name: 'Toko Yuni',
    amount: 'Rp 17.000',
    description: 'Ayam Krispi',
    category: 'Hutang',
    dateline: 'Lunas',
    date : '12 Desember 2024'
  ),
  Hutang(
    name: 'Bangunanmu',
    amount: 'Rp 185.000',
    description: 'Cat No Drop Kuning Telor Asin',
    category: 'Hutang',
    dateline: 'Belum Lunas',
    date : '12 Desember 2024'
  ),
  
];
