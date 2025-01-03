import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String selectedNotification = 'Rata-rata pengeluaran';
  String selectedLanguage = 'Indonesia';
  bool isSecurityEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4FE),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  // Header
                  Container(
                    width: double.infinity,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Color(0xFF4A63E2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.chevronLeft,
                              color: Colors.white,
                              size: 24,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(width: 16),
                          const AutoSizeText(
                            'Edit Tabungan',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AutoSizeText(
                          'Notifikasi',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          maxFontSize: 18,
                          minFontSize: 14,
                        ),
                        const SizedBox(height: 8), // Jarak antara judul dan opsi
                        const Divider(),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 8), // Meratakan margin kiri-kanan
                          dense: true, // Mengurangi jarak antar opsi
                          title: const AutoSizeText(
                            'Tabungan berencana',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                            maxFontSize: 16,
                            minFontSize: 12,
                          ),
                          trailing: Radio(
                            value: 'Tabungan berencana',
                            groupValue: selectedNotification,
                            onChanged: (value) {
                              setState(() {
                                selectedNotification = value.toString();
                              });
                            },
                          ),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                          dense: true,
                          title: const AutoSizeText(
                            'Rata-rata pengeluaran',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                            maxFontSize: 16,
                            minFontSize: 12,
                          ),
                          trailing: Radio(
                            value: 'Rata-rata pengeluaran',
                            groupValue: selectedNotification,
                            onChanged: (value) {
                              setState(() {
                                selectedNotification = value.toString();
                              });
                            },
                          ),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                          dense: true,
                          title: const AutoSizeText(
                            'Berita terkini',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                            maxFontSize: 16,
                            minFontSize: 12,
                          ),
                          trailing: Radio(
                            value: 'Berita terkini',
                            groupValue: selectedNotification,
                            onChanged: (value) {
                              setState(() {
                                selectedNotification = value.toString();
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        const AutoSizeText(
                          'Keamanan',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          maxFontSize: 18,
                          minFontSize: 14,
                        ),
                        const SizedBox(height: 8),
                        const Divider(),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                          dense: true,
                          title: const AutoSizeText(
                            'Aktifkan pin dan sidik jari',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                            maxFontSize: 16,
                            minFontSize: 12,
                          ),
                          trailing: Switch(
                            value: isSecurityEnabled,
                            onChanged: (value) {
                              setState(() {
                                isSecurityEnabled = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
