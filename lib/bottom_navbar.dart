import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monkeep/Screens/addTabungan.dart';
import 'package:monkeep/Screens/addTransaction.dart';
import 'package:monkeep/Screens/home.dart';
import 'package:monkeep/Screens/addHutang.dart';
import 'package:monkeep/Screens/laporanSaldo.dart';
import 'package:monkeep/Screens/saya.dart';
import 'package:monkeep/Screens/tabunganBerencana.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index_color = 0;
  List<Widget> screens = [Home(), LaporanSaldo(), Container(), Tabunganberencana(), Saya()];

  void onAddButtonClick() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 230,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Image.asset('images/MoneyBag.png'),
                title: AutoSizeText("Tambah Catatan Transaksi"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddTransaction()),
                  );
                },
              ),
              ListTile(
                leading: Image.asset('images/BankBuilding.png'),
                title: AutoSizeText("Tambah Catatan Hutang Piutang"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddHutang()),
                  );
                },
              ),
              ListTile(
                leading: Image.asset('images/MoneyBox.png'),
                title: AutoSizeText("Tambah Tabungan Berencana"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddTabungan()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index_color],
      floatingActionButton: FloatingActionButton(
        onPressed: onAddButtonClick,
        child: FaIcon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
        shape: CircleBorder(),
        backgroundColor: Color(0xff4A63E2),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15), 
              blurRadius: 12, 
              offset: Offset(0, -3), 
            ),
          ],
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavBarItem(FontAwesomeIcons.house, "Beranda", 0),
                _buildNavBarItem(FontAwesomeIcons.moneyBill1Wave, "Laporan", 1),
                const SizedBox(width: 10), 
                _buildNavBarItem(FontAwesomeIcons.piggyBank, "Tabungan", 3),
                _buildNavBarItem(FontAwesomeIcons.user, "Saya", 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index_color = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            icon,
            size: 24,
            color: index_color == index ? Color(0xff808CFA) : Color(0xffC5BAFC),
          ),
          AutoSizeText(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10,
              color: index_color == index ? Color(0xff808CFA) : Color(0xffC5BAFC),
            ),
            maxLines: 1,
            maxFontSize: 14,
            minFontSize: 10,
          ),
        ],
      ),
    );
  }
}
