import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LaporanHutang extends StatelessWidget {
  const LaporanHutang({super.key});

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
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
              child: 
                     AutoSizeText('Laporan Keuangan',
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

            

            
            

          ]
          ))
        ],
      ),
    )
  );
 }
}