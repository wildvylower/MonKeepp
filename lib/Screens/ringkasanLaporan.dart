import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Ringkasanlaporan extends StatelessWidget {
  const Ringkasanlaporan({super.key});

  @override
 Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xFFF3F4FE),
    body : SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([
            // Header Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AutoSizeText(
                      'Laporan',
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


            

            
            

          ]
          ))
        ],
      ),
    )
  );
 }
}