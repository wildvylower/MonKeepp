import 'package:flutter/material.dart';
import 'package:monkeep/Screens/addHutang.dart';
import 'package:monkeep/bottom_navbar.dart';
import 'Screens/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottom(),
    );
  }
}