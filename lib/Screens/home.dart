import 'package:flutter/material.dart';
import 'package:monkeep/models/data.dart'; 
import 'package:fl_chart/fl_chart.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    //dummy buat statistik
    final List<FlSpot> expenseData = [
      FlSpot(0, 10), // Contoh data: minggu pertama
      FlSpot(1, 30), // minggu kedua
      FlSpot(2, 20), // minggu ketiga
      FlSpot(3, 50), // minggu keempat
    ];

    return Scaffold(
      backgroundColor: Color(0xFFF3F4FE),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                // Header Section
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/homepage.png'),
                          fit: BoxFit.cover,
                        ),
                        color: Color(0xFF4A63E2),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Halo, Sumbul',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Gimana manajemen keuanganmu bulan ini?',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 90,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 90,
                                width: 170,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Saldo',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF4A63E2),
                                        ),
                                      ),
                                      Text(
                                        'Rp 800.000,00',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                height: 90,
                                width: 170,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Rata-rata pengeluaran',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF4A63E2),
                                        ),
                                      ),
                                      Text(
                                        'Rp 40.000,00',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Reminder Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 4,
                          spreadRadius: 2,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/homepageOMG.png',
                            width: 83,
                            height: 76,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sisa anggaranmu tinggal sedikit, nih. Jangan sampai lewat batas, ya!',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Non-aktifkan reminder',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    color: Color(0xFF4A63E2),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // Last Transactions Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transaksi terakhir',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Lainnya',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Transaction List Section
               Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical : 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Warna latar belakang
                      borderRadius: BorderRadius.circular(10), // Radius sudut untuk seluruh list
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // Warna bayangan
                          blurRadius: 6, // Intensitas blur
                          offset: Offset(0, 3), 
                          spreadRadius: 2
                        ),
                      ],
                    ),
                    child: Column(
                      children: dummyTransactions.map((transaction) {
                        return Column(
                          children: [
                            buildTransactionTile(transaction),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),

                //header statistik keuangan
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Text(
                          'Ringkasan Keuanganmu',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                    ),

                //statisik keuangan
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Container(
                      width: double.infinity,
                      height: 240,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: Offset(0, 3),
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0), // Menambahkan padding di dalam container
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Statistik Keuanganmu Bulan Ini',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                           SizedBox(height: 10),
                          Expanded(
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(show: false),
                                titlesData: FlTitlesData(
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 30,
                                      interval: 20,
                                      getTitlesWidget: (value, meta) {
                                        return Text(
                                          '${value.toInt()}%',
                                          style: TextStyle(fontSize: 10, color: Colors.black),
                                        );
                                      },
                                    ),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      getTitlesWidget: (value, meta) {
                                        final monthLabels = ['Minggu 1', 'Minggu 2', 'Minggu 3', 'Minggu 4'];
                                         if (value == 0 || value == 1 || value == 2 || value == 3) {
                                          return Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              monthLabels[value.toInt()],
                                              style: TextStyle(fontSize: 10, color: Colors.black),
                                            ),
                                          );
                                        } else {
                                          return Container(); // Kembalikan Container kosong jika label tidak diperlukan
                                        }
                                      },
                                        
                                      
                                    ),
                                  ),
                                  rightTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false), // Hide right labels
                                  ),
                                  topTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false), // Hide top labels
                                  ),
                                ),
                                borderData: FlBorderData(
                                  show: true,
                                  border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
                                ),
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: expenseData,
                                    isCurved: true,
                                    color: Color(0xFF4A63E2),
                                    barWidth: 3,
                                    dotData: FlDotData(show: false),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          ],
                        ),
                      ),
                    ),
                  )

                  
                

              ]),
            ),
          ],
        ),
      ),
    );
  }

  Container buildTransactionTile(Add_data history) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    child: Row(
      children: [
        // Leading icon
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            'images/${history.icon}',
            height: 30, // Ukuran ikon diperbesar agar terlihat jelas
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 16), // Jarak antara ikon dan teks

        // Middle section with name and description
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                history.name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4), 
              Text(
                ' ${history.description}',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF4A63E2),
                ),
              ), 
            ],
          ),
          
        ),
           SizedBox(width: 60), 
        // Right-aligned amount
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              history.category, // Menampilkan tipe pemasukan/pengeluaran
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: history.category == 'Pemasukan' ? Color(0xFF4A63E2) : Color(0xFF808CFA),
              ),
            ),
            SizedBox(height: 4),
            Text(
              history.amount, // Menampilkan jumlah transaksi
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

    
  
}
