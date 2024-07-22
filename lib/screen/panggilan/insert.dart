import 'package:bamservices/theme/bam.colors.dart';
import 'package:bamservices/theme/bam.constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bamservices/model/dropdown.teknisi.dart';
import 'package:bamservices/model/env.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InsertPanggilanScreen extends StatefulWidget {
  const InsertPanggilanScreen({super.key});

  @override
  State<InsertPanggilanScreen> createState() => _InsertPanggilanScreenState();
}

class _InsertPanggilanScreenState extends State<InsertPanggilanScreen> {
  String _tek = '';
  List<Teknisi> technicians = [];

  final _formKey = GlobalKey<FormState>();
  final _lok = TextEditingController();
  final _kel = TextEditingController();

  Future<void> fetchTechnicians() async {
    try {
      final response = await http.get(Uri.parse(Env.API_URL + 'teknisi/all'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<Teknisi> fetchedTechnicians = [];
        for (var item in jsonData) {
          fetchedTechnicians.add(Teknisi.fromJson(item));
        }
        setState(() {
          technicians = fetchedTechnicians;
        });
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> insertPanggilan() async {
    if (_lok.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lokasi harus diisi'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'Dismiss',
            disabledTextColor: Colors.white,
            textColor: Colors.yellow,
            onPressed: () {
              //Do whatever you want
            },
          ),
        ),
      );
    } else if (_tek == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Teknisi harus dipilih'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'Dismiss',
            disabledTextColor: Colors.white,
            textColor: Colors.yellow,
            onPressed: () {
              //Do whatever you want
            },
          ),
        ),
      );
    } else if (_kel.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Keluhan harus diisi'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'Dismiss',
            disabledTextColor: Colors.white,
            textColor: Colors.yellow,
            onPressed: () {
              //Do whatever you want
            },
          ),
        ),
      );
    } else {
      try {
        final response = await http.post(
          Uri.parse(Env.API_URL + 'panggilan/insert'),
          body: {
            'lok': _lok.text,
            'kel': _kel.text,
            'id_tek': _tek,
          },
        );
        if (response.statusCode == 200) {
          showSnackBar(context);
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/panggilan', (Route<dynamic> route) => false);
        } else {
          print('Error: ${response.reasonPhrase}');
        }
      } catch (error) {
        print('Error: $error');
      }
    }

  }

  @override
  void initState() {
    super.initState();
    fetchTechnicians();
  }

  @override
  void dispose() {
    _lok.dispose();
    _kel.dispose();
    super.dispose();
  }

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Sukses menambahkan panggilan'),
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'Dismiss',
        disabledTextColor: Colors.white,
        textColor: Colors.yellow,
        onPressed: () {
          //Do whatever you want
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    var _width = ResponsiveDimension.screenWidth(context);
    var _height = ResponsiveDimension.screenHeight(context);
    return Scaffold(
        backgroundColor: black_color,
        body: Container(
            width: _width,
            height: _height,
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.only(bottom: 40),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 1),
                                      decoration: BoxDecoration(
                                        color: red_color,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color: white_color,
                                          ),
                                          color: white_color,
                                          hoverColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onPressed: () => {
                                                Navigator.pop(context),
                                              }),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 5,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Input Panggilan',
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: white_color,
                                    ),
                                  ),
                                  Text(
                                    'Input Data Panggilan Teknisi',
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      color: white_color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 1),
                                      decoration: BoxDecoration(
                                        color: green_color,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.check,
                                            color: white_color,
                                          ),
                                          color: white_color,
                                          hoverColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onPressed: () => {
                                                if (_formKey.currentState!
                                                    .validate())
                                                  {
                                                    insertPanggilan(),
                                                  }
                                                else
                                                  {print('error')}
                                              }),
                                    ),
                                  ],
                                ),
                              )),
                        ]),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    TextFormField(
                      controller: _lok,
                      style: GoogleFonts.lato(fontSize: 14),
                      autofocus: false,
                      decoration: InputDecoration(
                        hoverColor: Colors.transparent,
                        hintText: 'Lokasi',
                        fillColor: white_color,
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  decoration: BoxDecoration(
                    color: white_color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: '',
                        style:
                            GoogleFonts.lato(fontSize: 14, color: black_color),
                        onChanged: (newValue) {
                          setState(() {
                            _tek = newValue!;
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            value: '',
                            child: Text(
                              'Teknisi',
                              style: TextStyle(
                                  color: black_color.withOpacity(0.5)),
                            ),
                          ),
                          ...technicians.map((technician) {
                            return DropdownMenuItem(
                              value: technician.id_tek,
                              child: Text(technician.name),
                            );
                          }).toList(),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    TextFormField(
                      controller: _kel,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      style: GoogleFonts.lato(fontSize: 14),
                      autofocus: false,
                      decoration: InputDecoration(
                        hoverColor: Colors.transparent,
                        hintText: 'Keluhan',
                        fillColor: white_color,
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            )));
  }
}
