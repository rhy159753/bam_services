import 'package:flutter/material.dart';
import 'package:bamservices/theme/bam.colors.dart';
import 'package:bamservices/theme/bam.constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bamservices/screen/servisan/widgets/list_services.dart';

import 'package:bamservices/model/env.dart';
import 'package:bamservices/model/card.servisan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shimmer/shimmer.dart';

class Services_Section extends StatefulWidget {
  const Services_Section({super.key});

  @override
  State<Services_Section> createState() => _Services_SectionState();
}

class _Services_SectionState extends State<Services_Section> {
  late String categorySearch = "Terbaru";
  late String statusCategory = "";
  late String link = Env.API_URL + 'servisan/latest';
  late Future<List<Servisan>> _servisan_list;

  Future<List<Servisan>> fetchData(api) async {
    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Servisan.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  @override
  void linkStatus(stat) {
    switch (stat) {
      case 'Terbaru':
        link = Env.API_URL + 'servisan/latest';
        break;
      case 'Status - Pending':
        link = Env.API_URL + 'servisan/status?stat=1';
        break;
      case 'Status - On Progress':
        link = Env.API_URL + 'servisan/status?stat=3';
        break;
      case 'Status - Tunggu Konfirmasi':
        link = Env.API_URL + 'servisan/status?stat=2';
        break;
      case 'Status - Tdk Dpt Dikerjakan':
        link = Env.API_URL + 'servisan/status?stat=8';
        break;
      case 'Status - Dibatalkan':
        link = Env.API_URL + 'servisan/status?stat=9';
        break;
      case 'Status - Diambil':
        link = Env.API_URL + 'servisan/status?stat=0';
        break;
      default:
        link = Env.API_URL + 'servisan/latest';
    }

    setState(() {
      _servisan_list = fetchData(link);
    });
  }

  @override
  void initState() {
    super.initState();
    _servisan_list = fetchData(link);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _height = ResponsiveDimension.screenHeight(context);
    return Column(children: [
      Container(
        height: 50,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'List Servisan',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: white_color,
                    ),
                  ),
                  Text(
                    categorySearch,
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
              flex: 5,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 1, vertical: 1),
                    //   decoration: BoxDecoration(
                    //     color: primary_color,
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   child: IconButton(
                    //       icon: Icon(
                    //         Icons.search,
                    //         color: white_color,
                    //       ),
                    //       color: white_color,
                    //       hoverColor: Colors.transparent,
                    //       splashColor: Colors.transparent,
                    //       highlightColor: Colors.transparent,
                    //       onPressed: () => {
                    //             showGeneralDialog(
                    //                 context: context,
                    //                 pageBuilder: (context, anim1, anim2) =>
                    //                     searchOverlayDialog(context),
                    //                 barrierDismissible: true,
                    //                 barrierLabel: '',
                    //                 transitionDuration:
                    //                     Duration(milliseconds: 200),
                    //                 transitionBuilder:
                    //                     (context, anim1, anim2, child) {
                    //                   return SlideTransition(
                    //                     position: Tween(
                    //                             begin: Offset(0, 1),
                    //                             end: Offset(0, 0))
                    //                         .animate(anim1),
                    //                     child: child,
                    //                   );
                    //                 })
                    //           }),
                    // ),
                    // SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 1, vertical: 1),
                      decoration: BoxDecoration(
                        color: primary_color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.clear_all_rounded,
                            color: white_color,
                          ),
                          color: white_color,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () => {categoryOverlayDialog(context)}),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 1, vertical: 1),
                      decoration: BoxDecoration(
                        color: primary_color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: white_color,
                          ),
                          color: white_color,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () => {
                                Navigator.pushNamed(
                                    context, '/insert_services'),
                              }),
                    ),
                  ],
                ),
              ))
        ]),
      ),
      Container(
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        height: _height * 0.788,
        child: StreamBuilder(
            stream: _servisan_list.asStream(), 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < 8; i++) SkeletonServices(),
                    ]
                  ),
                );
              }
              else if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(
                    color: primary_color,
                  ),
                );
              } else {
                var data = snapshot.data;
                return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: data!.map((servisan) {
                    return ListServices(
                      noservis: servisan.noserv,
                      jebar: servisan.jebar,
                      atn: servisan.atn,
                      tgl: servisan.wkt_dtg,
                      stat: servisan.stat,
                    );
                  }).toList(),
                  
                ),
              );
              }
            }
          ),
      ),
    ]);
  }

  void categoryOverlayDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  5.0,
                ),
              ),
            ),
            contentPadding: EdgeInsets.all(0),
            backgroundColor: Colors.transparent,
            content: Container(
              height: 50,
              decoration: BoxDecoration(
                color: black_color,
                border: Border.all(
                  color: white_color,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    15.0,
                  ),
                ),
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: white_color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      value: categorySearch,
                      style: GoogleFonts.lato(fontSize: 14, color: black_color),
                      onChanged: (newValue) {
                        setState(() {
                          categorySearch = newValue!;
                          linkStatus(newValue);
                        });
                        Navigator.of(context).pop();
                      },
                      items: [
                        DropdownMenuItem(
                          value: 'Terbaru',
                          child: Text('Terbaru'),
                        ),
                        DropdownMenuItem(
                          value: 'Status - Pending',
                          child: Text('Status - Pending'),
                        ),
                        DropdownMenuItem(
                          value: 'Status - On Progress',
                          child: Text('Status - On Progress'),
                        ),
                        DropdownMenuItem(
                          value: 'Status - Tunggu Konfirmasi',
                          child: Text('Status - Tunggu Konfirmasi'),
                        ),
                        DropdownMenuItem(
                          value: 'Status - Tdk Dpt Dikerjakan',
                          child: Text('Status - Tdk Dpt Dikerjakan'),
                        ),
                        DropdownMenuItem(
                          value: 'Status - Dibatalkan',
                          child: Text('Status - Dibatalkan'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

Widget searchOverlayDialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          5.0,
        ),
      ),
    ),
    contentPadding: EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    content: Container(
      decoration: BoxDecoration(
        color: black_color,
        border: Border.all(
          color: white_color,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            15.0,
          ),
        ),
      ),
      height: 200,
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                  style: GoogleFonts.lato(fontSize: 14, color: black_color),
                  onChanged: (newValue) {},
                  items: [
                    DropdownMenuItem(
                      value: '',
                      child: Text(
                        'Pencarian Berdasarkan',
                        style: TextStyle(color: black_color.withOpacity(0.5)),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'No - Servis',
                      child: Text('No - Servis'),
                    ),
                    DropdownMenuItem(
                      value: 'Jenis Barang',
                      child: Text('Jenis Barang'),
                    ),
                    DropdownMenuItem(
                      value: 'Atas Nama',
                      child: Text('Atas Nama'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: Column(children: [
              TextField(
                style: GoogleFonts.lato(fontSize: 14),
                autofocus: false,
                decoration: InputDecoration(
                  hoverColor: Colors.transparent,
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
              // Button
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () => {Navigator.of(context).pop()},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: red_color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Batal',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: white_color,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () => {Navigator.of(context).pop()},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: green_color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Cari',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: white_color,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    ),
  );
}

class SkeletonServices extends StatelessWidget {
  const SkeletonServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: primary_color,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                Container(
                  width: 100,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            ),
            Container(
              width: 100,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                Container(
                  width: 100,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}