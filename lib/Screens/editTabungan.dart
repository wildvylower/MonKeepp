import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monkeep/models/tabungan.dart';
import 'package:intl/intl.dart';

class Edittabungan extends StatefulWidget {
  final Tabungan tabungan;
  const Edittabungan({Key? key, required this.tabungan}) : super(key: key);

  @override
  State<Edittabungan> createState() => _EditTabunganState();
}

class _EditTabunganState extends State<Edittabungan> {
  String formatCurrency(double value) {
    final NumberFormat formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(value);
  }

  late TextEditingController _nameController;
  late TextEditingController _targetController;
  late TextEditingController _dateController; 
  late TextEditingController _amountController;
  bool _isEditing = false;
  bool _isEditingTarget = false;
  bool _isEditingDate = false; 
  bool _isEditingAmount = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.tabungan.name);
    _targetController = TextEditingController(text: formatCurrency(widget.tabungan.target));
    _dateController = TextEditingController(text: DateFormat('dd/MM/yyyy').format(widget.tabungan.deadlineDate)); 
    _amountController = TextEditingController(text: formatCurrency(widget.tabungan.amount));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _targetController.dispose();
    _dateController.dispose(); 
    _amountController.dispose(); 
    super.dispose();
  }

  // Fungsi untuk memilih tanggal
  Future<void> _selectDate(BuildContext context) async {
    DateTime deadline = widget.tabungan.deadlineDate;
    DateTime initialDate = deadline;
    DateTime firstDate = DateTime(2000);
    DateTime lastDate = DateTime(2101);
    
    

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null && pickedDate != initialDate) {
      setState(() {
        deadline = pickedDate;
        _dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate); // Menampilkan tanggal yang dipilih
      });
    }
  }

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

                  // Body
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        Image.asset(
                          'images/editTabungan.png',
                          width: 200,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_isEditing)
                              Flexible(
                                child: TextField(
                                  controller: _nameController,
                                  autofocus: true,
                                  onSubmitted: (value) {
                                    if (value.isNotEmpty) {
                                      setState(() {
                                        widget.tabungan.name = value;
                                        _isEditing = false;
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Nama tidak boleh kosong'),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              )
                            else
                              Flexible(
                                child: AutoSizeText(
                                  widget.tabungan.name,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  maxFontSize: 18,
                                  minFontSize: 14,
                                ),
                              ),
                            const SizedBox(width: 15),
                            IconButton(
                              icon: const Icon(
                                FontAwesomeIcons.pencil,
                                color: Color(0xff4A63E2),
                                size: 18,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isEditing = !_isEditing;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),

                  // Target Menabung
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 4,
                            spreadRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AutoSizeText(
                              'Target Menabung',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              maxFontSize: 16,
                              minFontSize: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // If editing target, show TextField
                                if (_isEditingTarget)
                                  Flexible(
                                    child: TextField(
                                      controller: _targetController,
                                      autofocus: true,
                                      keyboardType: TextInputType.number,
                                      onSubmitted: (value) {
                                        if (value.isNotEmpty) {
                                          setState(() {
                                            widget.tabungan.target = double.parse(value.replaceAll(',', '').replaceAll('Rp ', ''));
                                            _isEditingTarget = false;
                                          });
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Target tidak boleh kosong'),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  )
                                else
                                  AutoSizeText(
                                    formatCurrency(widget.tabungan.target),
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    maxFontSize: 18,
                                    minFontSize: 14,
                                  ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isEditingTarget = !_isEditingTarget;
                                    });
                                  },
                                  child: AutoSizeText(
                                    'Ubah',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      color: Color(0xff4A63E2),
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xff4A63E2),
                                    ),
                                    maxLines: 1,
                                    maxFontSize: 16,
                                    minFontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox( height: 20,),

                            const AutoSizeText(
                              'Tenggat Waktu',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              maxFontSize: 16,
                              minFontSize: 12,
                            ),
                           Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Jika sedang mengedit tanggal, tampilkan TextField
                                if (_isEditingDate)
                                  Flexible(
                                    child: TextField(
                                      controller: _dateController,
                                      autofocus: true,
                                      readOnly: true,
                                      onTap: () async {
                                        await _selectDate(context); // Memanggil fungsi _selectDate
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Pilih Tanggal',
                                        suffixIcon: const Icon(Icons.calendar_today),
                                      
                                      ),
                                    ),
                                  )
                                else
                                  Flexible(
                                    child: AutoSizeText(
                                      _dateController.text, // Menampilkan tanggal dari controller
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      maxFontSize: 18,
                                      minFontSize: 14,
                                    ),
                                  ),
                                GestureDetector(
                                  onTap: () {
                              if (_isEditingDate) {
                                // Jika selesai mengedit, perbarui nilai tanggal di model
                                setState(() {
                                  widget.tabungan.deadlineDate =
                                      DateFormat('dd/MM/yyyy').parse(_dateController.text);
                                  _isEditingDate = false; // Kembali ke mode tampilan
                                });
                              } else {
                                setState(() {
                                  _isEditingDate = true; // Masuk ke mode edit
                                });
                              }
                            },
                                  child: AutoSizeText(
                                    _isEditingDate ? 'OK' : 'Ubah', // Menampilkan OK saat sedang edit
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      color: Color(0xff4A63E2),
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xff4A63E2),
                                    ),
                                    maxLines: 1,
                                    maxFontSize: 16,
                                    minFontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                           SizedBox( height: 20,),

                            const AutoSizeText(
                              'Sudah ditabung',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              maxFontSize: 16,
                              minFontSize: 12,
                            ),
                           Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Jika sedang mengedit tanggal, tampilkan TextField
                                if (_isEditingAmount)
                                  Flexible(
                                    child: TextField(
                                      controller: _amountController,
                                      autofocus: true,
                                      keyboardType: TextInputType.number,
                                      onSubmitted: (value) {
                                        if (value.isNotEmpty) {
                                          setState(() {
                                            widget.tabungan.amount = double.parse(value.replaceAll(',', '').replaceAll('Rp ', ''));
                                            _isEditingAmount = false;
                                          });
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Tabungan tidak boleh kosong'),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  )
                               else
                                  AutoSizeText(
                                    formatCurrency(widget.tabungan.amount),
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    maxFontSize: 18,
                                    minFontSize: 14,
                                  ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isEditingAmount = !_isEditingAmount;
                                    });
                                  },
                                  child: AutoSizeText(
                                    'Ubah',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      color: Color(0xff4A63E2),
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xff4A63E2),
                                    ),
                                    maxLines: 1,
                                    maxFontSize: 16,
                                    minFontSize: 12,
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),

                 Padding(
  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
  child: ElevatedButton(
    onPressed: () {
      // Pop the current screen and return to the previous one
      Navigator.pop(context);
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF4A63E2), // Button color
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: const Text(
      'Save',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
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
