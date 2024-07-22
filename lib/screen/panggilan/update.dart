import 'package:bamservices/theme/bam.colors.dart';
import 'package:bamservices/theme/bam.constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bamservices/model/env.dart';
import 'dart:convert';
import 'package:bamservices/model/dropdown.teknisi.dart';
import 'package:http/http.dart' as http;

class UpdatePanggilanScreen extends StatefulWidget {
  const UpdatePanggilanScreen({super.key});

  @override
  State<UpdatePanggilanScreen> createState() => _UpdatePanggilanScreenState();
}

class _UpdatePanggilanScreenState extends State<UpdatePanggilanScreen> {
  List<Teknisi> technicians = [];
  String _stat = '';

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ket = TextEditingController();

  Future<void> updatePanggilan(id) async {
    if (_stat == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Status harus dipilih'),
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
    } else if (_ket.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Keterangan harus diisi'),
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
      final dataUpdate = {
        'id_pgl': id,
        'stat': _stat,
        'ket': _ket.text,
      };
      try {
        final response = await http.post(
            Uri.parse(Env.API_URL + 'panggilan/update'),
            body: dataUpdate);
        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          if (jsonData['status'] == true) {
            showSnackBar(context);
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/panggilan', (Route<dynamic> route) => false);
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
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _ket.dispose();
    super.dispose();
  }

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Sukses update data panggilan'),
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
                                  'Update Panggilan',
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: white_color,
                                  ),
                                ),
                                Text(
                                  'Data Update Panggilan',
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
                                                  updatePanggilan(
                                                      jsonDe[0]['id_pgl']),
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
                          initialValue: jsonDe[0]['lok'],
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: white_color),
                          autofocus: false,
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            label: Text(
                              "Lokasi",
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
                    Container(
                      width: double.infinity,
                      child: Column(children: [
                        TextFormField(
                          enabled: false,
                          initialValue: jsonDe[0]['id_tek'],
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: white_color),
                          autofocus: false,
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            label: Text(
                              "Teknisi",
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
                    Form(
                      key: _formKey,
                      child: Column(children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text("Status",
                                style: GoogleFonts.lato(
                                    fontSize: 11, color: white_color))),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          decoration: BoxDecoration(
                            color: white_color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              DropdownButtonFormField<String>(
                                value: '',
                                style: GoogleFonts.lato(
                                    fontSize: 14, color: black_color),
                                onChanged: (newValue) {
                                  print(newValue);
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
                                          color: black_color.withOpacity(0.5)),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Pending',
                                    child: Text('Pending'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'On The Way',
                                    child: Text('On The Way'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Tdk Dpt Dikerjakan',
                                    child: Text('Tdk Dpt Dikerjakan'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Selesai',
                                    child: Text('Selesai'),
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
                            TextField(
                              controller: _ket,
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
                      ]),
                    ),
                  ]),
                )
              ],
            )));
  }
}
