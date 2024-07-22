import 'package:bamservices/screen/info/components/card.dart';
import 'package:bamservices/theme/bam.colors.dart';
import 'package:bamservices/theme/bam.constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
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
            Container(
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Info Status Servisan & Panggilan',
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: white_color,
                              ),
                            ),
                            Text(
                              'Berikut ini status berdasarkan warna :',
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                color: white_color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(height: 20),
            StatusCard(status: "Pending", color: yellow_color),
            StatusCard(status: "On Progress / On The Way", color: blue_color),
            StatusCard(status: "Tunggu Konfirmasi", color: purple_color),
            StatusCard(status: "Tdk Dapat Dikerjakan", color: black_color),
            StatusCard(status: "Dibatalkan", color: red_color),
            StatusCard(status: "Diambil / Selesai", color: green_color),
          ],
        ),
      ),
    );
  }
}
