import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:monkeep/Screens/addTransaction.dart';

class DatabaseService {
  final _real = FirebaseDatabase.instance;

  create(MyTransaction transaction) {
    try {
      _real.ref("transaction").push().set(transaction.toMap());
    } catch (e) {
      log(e.toString());
    }
  }
}
