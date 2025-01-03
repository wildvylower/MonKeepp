import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:monkeep/bottom_navbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F4FE),
      body: SafeArea( // SafeArea membungkus seluruh body
        child: Stack(
          children: [
            // Background setengah lingkaran biru
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'images/Ellipse 7.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Konten Onboarding
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Menambahkan Padding yang lebih besar agar teks turun lebih
                Padding(
                  padding: EdgeInsets.only(top: 50), // Atur nilai top padding untuk menurunkan teks
                  child: AutoSizeText(
                    'Halo Callisto!\nSelamat datang di Monkeep!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                    maxLines: 2,
                    maxFontSize: 18,
                    minFontSize: 14,
                  ),
                ),
                SizedBox(height: 20),  // Memberikan jarak antara teks dan gambar
                // Konten utama gambar dan indikator
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Menjaga agar gambar dan konten lainnya terpusat secara vertikal
                    children: [
                      Expanded(
                        child: PageView(
                          controller: _controller,
                          onPageChanged: (index) {
                            setState(() {
                              isLastPage = index == 2; // Update sesuai jumlah slide
                            });
                          },
                          children: [
                            OnboardingPage(
                              image: 'images/1.png',
                              description:
                                  'Atur dan lihat manajemen keuanganmu dengan Monkeep!',
                            ),
                            OnboardingPage(
                              image: 'images/2.png',
                              description: 'Scan dan catat keuangan dengan mudah',
                            ),
                            OnboardingPage(
                              image: 'images/3.png',
                              description:
                                  'Lihat ringkasan keuangan dan transaksi terakhirmu.',
                            ),
                          ],
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3, // Update sesuai jumlah slide
                        effect: WormEffect(
                          dotColor: Color(0xffC5BAFC),
                          activeDotColor: Colors.white,
                          dotHeight: 8, // Ukuran titik lebih kecil
                          dotWidth: 8,  // Ukuran titik lebih kecil
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Menambahkan padding pada tombol untuk memberi jarak lebih
                Padding(
                  padding: EdgeInsets.only(bottom: 30), // Jarak dari bawah
                  child: ElevatedButton(
                    onPressed: isLastPage
                        ? () {
                            // Navigasikan ke halaman utama
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => Bottom()),
                            );
                          }
                        : () {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                    child: Text(isLastPage ? 'Mulai' : 'Lanjut'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50), // Lebar penuh dan tinggi tombol lebih besar
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String description;

  const OnboardingPage({
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 490,
          fit: BoxFit.cover, // Sesuaikan agar gambar lebih fleksibel
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30), // Gunakan padding kecil jika perlu
          child: AutoSizeText(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 14,
            ),
            maxLines: 2,
            maxFontSize: 16,
            minFontSize: 12,
          ),
        ),
      ],
    );
  }
}
