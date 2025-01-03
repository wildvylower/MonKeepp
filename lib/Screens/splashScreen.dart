import 'package:flutter/material.dart';
import 'dart:async';
import 'package:monkeep/Screens/onBoarding.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Variabel animasi
  double _topPosition1 = -155;
  double _rightPosition = -93;
  double _topPosition2 = 203;
  double _leftPosition2 = -43;
  double _topPosition3 = 649;
  double _leftPosition3 = -102;
  double _topPosition4 = 500;
  double _rightPosition2 = -170;


  @override
  void initState() {
    super.initState();

    // Delay untuk animasi
    Timer(Duration(seconds: 1), () {
      setState(() {
        _topPosition1 = 127;
        _rightPosition = 261;
        _topPosition2 = 676;
        _leftPosition2 = -7;
        _topPosition3 = 483;
        _leftPosition3 = 219;
        _topPosition4 = -20;
        _rightPosition2 = -170;

      });
    });

    // Pindah ke halaman berikutnya setelah splash selesai
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4A63E2),
      body: Stack(
        children: [
          // Lingkaran 1
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            top: _topPosition1,
            right: _rightPosition,
            child: Image.asset(
              'images/kanan atas.png',
              width: 400,
              height: 400,
            ),
          ),
          // Lingkaran 2
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            top: _topPosition2,
            left: _leftPosition2,
            child: Image.asset(
              'images/kiri tengah.png',
              height: 140,
              width: 140,
            ),
          ),
           AnimatedPositioned(
            duration: Duration(seconds: 2),
            top: _topPosition3,
            left: _leftPosition3,
            child: Image.asset(
              'images/kiri bawah.png',
              height: 400,
              width: 400,
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            top: _topPosition4,
            right: _rightPosition2,
            child: Image.asset(
              'images/kanan bawah.png',
              height: 400,
              width: 400,
            ),
          ),
          // Logo
          Center(
            child: Image.asset(
              'images/monkeep.png',
              width: 300,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Halaman Utama'),
      ),
    );
  }
}
