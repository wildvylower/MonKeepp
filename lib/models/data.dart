class Add_data {
  final String name;        // Nama aplikasi (misalnya, Gopay, OVO)
  final String amount;      // Jumlah transaksi 
  final String description;          // Kategori (Income atau Expense)
  final String category;    // Kategori transaksi (misalnya, Makanan, Transportasi)
  final String icon;        // Nama file icon aplikasi yang akan ditampilkan

  Add_data({
    required this.name,
    required this.amount,
    required this.description,
    required this.category,
    required this.icon,
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

final List<Add_data> dummyTransactions = [
  Add_data(
    name: 'Gopay',
    amount: 'Rp 10.000',
    description: 'Cilok Pak Elang',
    category: 'Pengeluaran',
    icon: 'gopay.png',
  ),
  Add_data(
    name: 'ShopeePay',
    amount: 'Rp 50.000',
    description: 'Kalung Kucing Cantik Liontin Hati',
    category: 'Pengeluaran',
    icon: 'shopepay.png',
  ),
  Add_data(
    name: 'Dana',
    amount: 'Rp 200.000',
    description: 'Art Commiss Semi Realistic Couple',
    category: 'Pemasukan',
    icon: 'dana.png',
  ),
  
];
