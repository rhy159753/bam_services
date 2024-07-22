import 'package:bamservices/model/env.dart';
import 'package:bamservices/theme/bam.colors.dart';
import 'package:bamservices/theme/bam.constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:bamservices/model/dropdown.teknisi.dart';
import 'package:http/http.dart' as http;

class UpdateServisanScreen extends StatefulWidget {
  const UpdateServisanScreen({super.key});

  @override
  State<UpdateServisanScreen> createState() => _UpdateServisanScreenState();
}

class _UpdateServisanScreenState extends State<UpdateServisanScreen> {
  List<Teknisi> technicians = [];
  String _tek = '';
  String _stat = '';

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ket = TextEditingController();

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

  Future<void> updateServisan(sb) async {
    final dataUpdate = {
      'noserv': sb,
      'id_tek': _tek,
      'stat': _stat,
      'ket': _ket.text,
    };
    try {
      final response = await http
          .post(Uri.parse(Env.API_URL + 'servisan/update'), body: dataUpdate);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['status'] == true) {
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

  @override
  void initState() {
    super.initState();
    fetchTechnicians();
  }

  @override
  void dispose() {
    _ket.dispose();
    super.dispose();
  }

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Sukses update data servisan'),
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

  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;
    final jsonEn = jsonEncode(data);
    final jsonDe = jsonDecode(jsonEn);

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
                Container(
                  height: 50,
                  margin: EdgeInsets.only(bottom: 60),
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
                                  'Update Servisan',
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: white_color,
                                  ),
                                ),
                                Text(
                                  'Data Update Servisan',
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
                                                  updateServisan(
                                                      jsonDe[0]['noserv']),
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
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    Container(
                      width: double.infinity,
                      child: Column(children: [
                        TextFormField(
                          enabled: false,
                          initialValue: jsonDe[0]['jebar'],
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: white_color),
                          autofocus: false,
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            label: Text(
                              "Nama Barang",
                              style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: white_color),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 1),
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
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: Column(children: [
                        TextFormField(
                          enabled: false,
                          initialValue: jsonDe[0]['acc'],
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: white_color),
                          autofocus: false,
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            label: Text(
                              "Aksesoris",
                              style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: white_color),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 1),
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
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: Column(children: [
                        TextFormField(
                          enabled: false,
                          initialValue: jsonDe[0]['atn'],
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: white_color),
                          autofocus: false,
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            label: Text(
                              "Atas Nama",
                              style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: white_color),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 1),
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
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: Column(children: [
                        TextFormField(
                          enabled: false,
                          initialValue: jsonDe[0]['telp'],
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: white_color),
                          autofocus: false,
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            label: Text(
                              "No Telp / WhatsApp",
                              style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: white_color),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 1),
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
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: Column(children: [
                        TextFormField(
                          enabled: false,
                          initialValue: jsonDe[0]['kel'],
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: white_color),
                          autofocus: false,
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            label: Text(
                              "Keluhan",
                              style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: white_color),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 1),
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
                    SizedBox(height: 20),

                    // ============== inputan ==================

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("Teknisi",
                                  style: GoogleFonts.lato(
                                      fontSize: 11, color: white_color))),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                DropdownButtonFormField<String>(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Teknisi tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hoverColor: Colors.transparent,
                                    hintText: 'Teknisi',
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
                                        child: Text("Teknisi",
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
                          SizedBox(height: 30),
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("Status",
                                  style: GoogleFonts.lato(
                                      fontSize: 11, color: white_color))),
                          Container(
                            width: double.infinity,
                            child: Column(
                              children: [
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    hoverColor: Colors.transparent,
                                    hintText: 'Status',
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
                                      return 'Status tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  value: '',
                                  style: GoogleFonts.lato(
                                      fontSize: 14, color: black_color),
                                  onChanged: (newValue) {
                                    setState(() {
                                      _stat = newValue!;
                                    });
                                  },
                                  items: [
                                    DropdownMenuItem(
                                      value: '',
                                      child: Text(
                                        'Status',
                                        style: TextStyle(
                                            color:
                                                black_color.withOpacity(0.5)),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Pending',
                                      child: Text('Pending'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'On Progress',
                                      child: Text('On Progress'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Tunggu Konfirmasi',
                                      child: Text('Tunggu Konfirmasi'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Tdk Dpt Diperbaiki',
                                      child: Text('Tdk Dpt Diperbaiki'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Diambil',
                                      child: Text('Diambil'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Dibatalkan',
                                      child: Text('Dibatalkan'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("Keterangan",
                                  style: GoogleFonts.lato(
                                      fontSize: 11, color: white_color))),
                          Container(
                            width: double.infinity,
                            child: Column(children: [
                              TextFormField(
                                controller: _ket,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Keterangan tidak boleh kosong';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                                style: GoogleFonts.lato(fontSize: 14),
                                autofocus: false,
                                decoration: InputDecoration(
                                  hoverColor: Colors.transparent,
                                  hintText: 'Keterangan',
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
                        ],
                      ),
                    ),

                    // ===========================
                  ]),
                ),
              ],
            )));
  }
}
