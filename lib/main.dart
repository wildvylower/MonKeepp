import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:monkeep/Screens/addHutang.dart';
import 'package:monkeep/bottom_navbar.dart';
import 'Screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:monkeep/Screens/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD1mWPHBwEhGEZIRQg1r33PlrxTnAucWtU",
            authDomain: "monkeep-e6e73.firebaseapp.com",
            projectId: "monkeep-e6e73",
            storageBucket: "monkeep-e6e73.firebasestorage.app",
            messagingSenderId: "698244472031",
            appId: "1:698244472031:web:fac70db440f54ac3aedd6a",
            measurementId: "G-SQJWD9TGE9"));
  } else {
    await Firebase.initializeApp();
    print("Firebase tersambung");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
