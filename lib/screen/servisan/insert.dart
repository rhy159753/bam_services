import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bamservices/theme/bam.colors.dart';
import 'package:bamservices/theme/bam.constant.dart';

import 'package:bamservices/model/dropdown.teknisi.dart';
import 'package:bamservices/model/env.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InsertServisanScreen extends StatefulWidget {
  const InsertServisanScreen({super.key});

  @override
  State<InsertServisanScreen> createState() => _InsertServisanScreenState();
}

class _InsertServisanScreenState extends State<InsertServisanScreen> {
  String _tek = '';
  List<Teknisi> technicians = [];

  final _formKey = GlobalKey<FormState>();
  final _jebar = TextEditingController();
  final _acc = TextEditingController();
  final _atn = TextEditingController();
  final _telp = TextEditingController();
  final _kel = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchTechnicians();
  }

  @override
  void dispose() {
    _jebar.dispose();
    _acc.dispose();
    _atn.dispose();
    _telp.dispose();
    _kel.dispose();
    super.dispose();
  }

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Sukses menambahkan data servisan'),
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

  Future<void> insertServisan() async {
    try {
      final response =
          await http.post(Uri.parse(Env.API_URL + 'servisan/insert'), body: {
        'jebar': _jebar.text,
        'acc': _acc.text,
        'atn': _atn.text,
        'telp': _telp.text,
        'kel': _kel.text,
        'id_tek': _tek,
      });
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        bool status = jsonData['status'];

        if (status == true) {
          showSnackBar(context);
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/servisan', (Route<dynamic> route) => false);
        } else {
          print('Error: ${response.reasonPhrase}');
        }
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

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
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(bottom: 40),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 1, vertical: 1),
                                            decoration: BoxDecoration(
                                              color: red_color,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: IconButton(
                                                icon: Icon(
                                                  Icons.arrow_back,
                                                  color: white_color,
                                                ),
                                                color: white_color,
                                                hoverColor: Colors.transparent,
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
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
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Input Servisan',
                                          style: GoogleFonts.lato(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: white_color,
                                          ),
                                        ),
                                        Text(
                                          'Input Data Barang Servisan',
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 1, vertical: 1),
                                            decoration: BoxDecoration(
                                              color: green_color,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: IconButton(
                                                icon: Icon(
                                                  Icons.check,
                                                  color: white_color,
                                                ),
                                                color: white_color,
                                                hoverColor: Colors.transparent,
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onPressed: () => {
                                                      if (_formKey.currentState!
                                                          .validate())
                                                        {insertServisan()}
                                                      else
                                                        {print('error')}
                                                    }),
                                          ),
                                        ],
                                      ),
                                    )),
                              ]),
                        ),
                        Container(
                          width: double.infinity,
                          child: Column(children: [
                            TextFormField(
                              controller: _jebar,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nama Barang tidak boleh kosong';
                                }
                                return null;
                              },
                              style: GoogleFonts.lato(fontSize: 14),
                              autofocus: false,
                              decoration: InputDecoration(
                                hoverColor: Colors.transparent,
                                hintText: 'Nama Barang',
                                fillColor: white_color,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 1),
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
                          child: Column(children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Aksesoris tidak boleh kosong';
                                }
                                return null;
                              },
                              controller: _acc,
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                              style: GoogleFonts.lato(fontSize: 14),
                              autofocus: false,
                              decoration: InputDecoration(
                                hoverColor: Colors.transparent,
                                hintText: 'Aksesoris',
                                fillColor: white_color,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 20),
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
                          child: Column(children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Atas Nama tidak boleh kosong';
                                }
                                return null;
                              },
                              controller: _atn,
                              style: GoogleFonts.lato(fontSize: 14),
                              autofocus: false,
                              decoration: InputDecoration(
                                hoverColor: Colors.transparent,
                                hintText: 'Atas Nama',
                                fillColor: white_color,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 1),
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
                          child: Column(children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'No Telp / WhatsApp tidak boleh kosong';
                                }
                                return null;
                              },
                              controller: _telp,
                              style: GoogleFonts.lato(fontSize: 14),
                              autofocus: false,
                              decoration: InputDecoration(
                                hoverColor: Colors.transparent,
                                hintText: 'No Telp / WhatsApp',
                                fillColor: white_color,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 1),
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
                          child: Column(children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Keluhan tidak boleh kosong';
                                }
                                return null;
                              },
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
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 20),
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
                          child: Column(
                            children: [
                              DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  hoverColor: Colors.transparent,
                                  hintText: 'Operator',
                                  fillColor: white_color,
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 1),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Operator tidak boleh kosong';
                                  }
                                  return null;
                                },
                                value: _tek,
                                style: GoogleFonts.lato(
                                    fontSize: 14, color: black_color),
                                onChanged: (newValue) {
                                  setState(() {
                                    _tek = newValue!;
                                  });
                                },
                                items: [
                                  DropdownMenuItem(
                                      value: "",
                                      child: Text("Operator",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              color: black_color
                                                  .withOpacity(0.5)))),
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
                      ],
                    )),
              ],
            )));
  }
}
