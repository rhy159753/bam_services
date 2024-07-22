import 'package:bamservices/model/card.panggilan.dart';
import 'package:flutter/material.dart';
import 'package:bamservices/theme/bam.colors.dart';
import 'package:bamservices/theme/bam.constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bamservices/screen/panggilan/widgets/list_calls.dart';

class CallsSearch_Section extends StatelessWidget {
  const CallsSearch_Section({super.key});

  @override
  Widget build(BuildContext context) {
    final getData = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final List<Panggilan> data =
        getData.map((e) => Panggilan.fromJson(e)).toList();

    var _height = ResponsiveDimension.screenHeight(context);
    return Column(children: [
      Container(
        height: 50,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            flex: 7,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hasil Pencarian',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: white_color,
                    ),
                  ),
                  Text(
                    'Berikut Tampilan Data Yang Anda Cari',
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
              flex: 3,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                            Icons.close,
                            color: white_color,
                          ),
                          color: white_color,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () => {Navigator.pop(context)}),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: data
                .map((e) => ListCalls(
                      id: e.id_pgl,
                      lokasi: e.lok,
                      tanggal: e.tgl,
                      status: e.stat,
                      teknisi: e.id_tek,
                    ))
                .toList(),
          ),
        ),
      ),
    ]);
  }
}
