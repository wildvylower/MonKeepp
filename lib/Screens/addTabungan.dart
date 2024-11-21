import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddTabungan extends StatelessWidget {
  const AddTabungan({super.key});

  @override
 Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xFFF3F4FE),
    body : SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([
            //header 
            Container(
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                color :  Color(0xFF4A63E2),
              ),
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FaIcon(
                      FontAwesomeIcons.chevronLeft,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(width: 16),
                     AutoSizeText('Tambah Tabungan Berencana',
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
            Padding(padding: EdgeInsets.all(16.0),
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
                          )
                        ]

                      ),
                      child: Padding(padding: EdgeInsets.all(16.0),
                      child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/AddTabungan.png',
                width: 80,
                height: 80,
                ),
                SizedBox(width: 10),
                Expanded(
                  child : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText('Monkeep bakal bantu simpenin uang tabunganmu biar ngga bocor kepake',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      maxFontSize: 16,
                      minFontSize: 12,
                      ),
                      AutoSizeText('Kamu bisa tarik uang tabunganmu lagi kalo udah memenuhi target!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        color: Color(0xFF4A63E2),
                      ),
                      maxLines: 2,
                      maxFontSize: 14,
                      minFontSize: 10,
                      )
                    ],
                ))
              ],
            ),
            
                      ),
                    )
            
            )
          ]
          ))
        ],
      ),
    )
  );
 }
}