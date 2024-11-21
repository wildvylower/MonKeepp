import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:monkeep/models/data.dart'; 
import 'package:fl_chart/fl_chart.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
  }

  class _HomeState extends State<Home> {
    final List<Add_data>data = dummyTransactions;
    final AutoSizeGroup containerSaldo = AutoSizeGroup();
    final AutoSizeGroup containerTransaction = AutoSizeGroup();

    @override

  Widget build(BuildContext context) {
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
                Stack( //pake stack soalnya biar bs pake bg image dan krn 1 container ini ada anak" nya lg
                  children: [
                    Container(
                      width: double.infinity, // lebar containernya full lebar layar
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
                        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Halo, Sumbul',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              maxFontSize: 24,
                              minFontSize: 16,
                            ),
                            AutoSizeText(
                              'Gimana manajemen keuanganmu bulan ini?',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              maxFontSize: 16,
                              minFontSize: 10,
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
                                            AutoSizeText(
                                              'Saldo',
                                              group: containerSaldo,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12, 
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF4A63E2),
                                              ),
                                              maxLines: 1,
                                              maxFontSize: 16,
                                              minFontSize: 10,
                                            ),
                                            AutoSizeText(
                                              'Rp 800.000,00',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 18, 
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              maxLines: 1,
                                              maxFontSize: 24,
                                              minFontSize: 12,
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
                                              AutoSizeText(
                                                'Rata-rata pengeluaran',
                                                group : containerSaldo,
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12, 
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF4A63E2),
                                                ),
                                              maxLines: 1,
                                              maxFontSize: 16,
                                              minFontSize: 10,
                                              ),
                                              AutoSizeText(
                                                'Rp 40.000,00',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 18, 
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                               ),
                                              maxLines: 1,
                                              maxFontSize: 24,
                                              minFontSize: 12,
                                    )
                                  ],
                                ),
                                ),
                              ))
                            ],
                          ),
                          )
                        )
                      ]

              ),


                       
                // Reminder Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) {
                            final containerWidth = constraints.maxWidth; 
                            final containerHeight = 100.0; 
                            return Container(
                              constraints: BoxConstraints(
                                maxWidth: containerWidth * 0.4,
                                maxHeight: containerHeight, 
                              ),
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
                                          AutoSizeText(
                                            'Sisa anggaranmu tinggal sedikit, nih. Jangan sampai lewat batas, ya!',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                            maxLines: 2,
                                            maxFontSize: 20,
                                            minFontSize: 10,
                                          ),
                                          AutoSizeText(
                                            'Non-aktifkan reminder',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              color: Color(0xFF4A63E2),
                                            ),
                                            maxLines: 1,
                                            maxFontSize: 14,
                                            minFontSize: 10,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                          
                  )
                ),


                // Last Transactions Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          'Transaksi terakhir',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          maxFontSize: 24,
                          minFontSize: 16,
                        ),
                        AutoSizeText(
                          'Lainnya',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          maxFontSize: 16,
                          minFontSize: 10,
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
                      color: Colors.white, 
                      borderRadius: BorderRadius.circular(10), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), 
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
                  child: AutoSizeText(
                          'Ringkasan Keuanganmu',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          maxFontSize: 24,
                          minFontSize: 16,
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
                            AutoSizeText(
                              'Statistik Keuanganmu Bulan Ini',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            maxLines: 1,
                            maxFontSize: 20,
                            minFontSize: 12,
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
                  ),

                   //header artikel keuangan
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: AutoSizeText(
                          'Jelajahi Dunia Keuangan',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          maxFontSize: 24,
                          minFontSize: 16,
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
              history.category, // Menampilkan tipe pemasukan/pengeluaran
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: history.category == 'Pemasukan' ? Color(0xFF4A63E2) : Color(0xFF808CFA),
              ),
              maxLines: 1,
              maxFontSize: 18,
              minFontSize: 12,
            ),
            SizedBox(height: 4),
            AutoSizeText(
              history.amount, // Menampilkan jumlah transaksi
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
