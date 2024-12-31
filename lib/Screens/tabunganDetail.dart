import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monkeep/models/tabungan.dart';
import 'package:intl/intl.dart';

class TabunganDetail extends StatelessWidget {
  final Tabungan tabungan;
  const TabunganDetail({Key? key, required this.tabungan}) : super(key: key);

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
    double progress = tabungan.amount / tabungan.target;
    if (progress > 1.0) progress = 1.0;
    final DateTime today = DateTime.now();
    final DateTime deadline = tabungan.deadlineDate;
    final int totalDays = deadline.difference(today).inDays;
    final double remainDays = totalDays > 0 
  ? totalDays / (365 * (deadline.year - today.year)) // Membagi berdasarkan tahun yang relevan
  : 0.0;
    final double sisaTarget = tabungan.target - tabungan.amount;
    final double targetPerHari = totalDays > 0 ? sisaTarget / totalDays : 0.0;
    

    return Scaffold(
      backgroundColor: Color(0xFFF3F4FE),
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
                    decoration: BoxDecoration(
                      color: Color(0xFF4A63E2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.chevronLeft,
                              color: Colors.white,
                              size: 24,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(width: 16),
                          AutoSizeText(
                            tabungan.name,
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
                        ],
                      ),
                    ),
                  ),

                  // Container image
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      width: 362,
                      height: 124,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 4,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/detailTabungan.png',
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    'Keren! Target tabunganmu udah mau terpenuhi, nih!',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    maxLines: 2,
                                    maxFontSize: 16,
                                    minFontSize: 12,
                                  ),
                                  AutoSizeText(
                                    'Tetap pertahanin semangat menabungmu ya!',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color: Color(0xFF4A63E2),
                                    ),
                                    maxLines: 2,
                                    maxFontSize: 14,
                                    minFontSize: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Stat tabungan
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 4,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "Progress Tabungan",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                              minFontSize: 10,
                              maxFontSize: 14,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xffD9D9D9),
                                  width: 2,
                                ),
                                color: const Color(0xffF3F4FE),
                              ),
                              child: ClipRRect(
                                child: LinearProgressIndicator(
                                  value: progress,
                                  color: const Color(0xff4A63E2),
                                  backgroundColor: Colors.transparent,
                                  minHeight: 12,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: Color(0xff4A63E2),
                                    border: Border.all(
                                  color: const Color(0xffD9D9D9), // Warna border
                                  width: 2,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                AutoSizeText.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Sudah ditabung : ',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          color: Colors.black, 
                                        ),
                                      ),
                                      TextSpan(
                                        text: formatCurrency(tabungan.amount),
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          color: Color(0xff4A63E2), 
                                        ),
                                      ),
                                    ],
                                  ),
                                  maxLines: 1,
                                  maxFontSize: 14,
                                  minFontSize: 10,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF3F4FE),
                                    border: Border.all(
                                  color: const Color(0xffD9D9D9), // Warna border
                                  width: 2,
                                    ),
                                  ),
                                ),
                               SizedBox(width: 10,),
                                AutoSizeText.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Target menabung : ',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          color: Colors.black, 
                                        ),
                                      ),
                                      TextSpan(
                                        text: formatCurrency(tabungan.target),
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          color: Color(0xff4A63E2), 
                                        ),
                                      ),
                                    ],
                                  ),
                                  maxLines: 1,
                                  maxFontSize: 14,
                                  minFontSize: 10,
                                )
                              ],
                            ),

                            SizedBox(height: 20),

                            AutoSizeText(
                              'Waktu Tersisa',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              maxFontSize: 14,
                              minFontSize: 10,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(children: [
                              Padding(padding: EdgeInsets.all(16),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: CircularProgressIndicator(
                                    value: remainDays,
                                    strokeWidth: 20,
                                    backgroundColor: Color(0xff808CFA),
                                    valueColor:
                                        AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                                Text(
                                  totalDays > 0
                                      ? '$totalDays hari'
                                      : 'Waktu habis!',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            
                            ),
                            SizedBox( width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                              'Target menabung per-hari',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                              ),
                              maxLines: 1,
                              maxFontSize: 14,
                              minFontSize: 10,
                             ),
                            AutoSizeText(
                              formatCurrency(targetPerHari),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                              ),
                              maxLines: 1,
                              maxFontSize: 20,
                              minFontSize: 16,
                             ),
                              ],
                            )
                             
                             

                            ],)
                            
                            
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


