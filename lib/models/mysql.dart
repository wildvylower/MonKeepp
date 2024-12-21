import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = 'localhost';
  static String user = 'root';
  static String password = 'd@tabaseFigure351629';
  static String db = 'monkeepdb';
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }
}
