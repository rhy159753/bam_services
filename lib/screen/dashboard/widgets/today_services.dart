import 'package:flutter/material.dart';
import 'package:bamservices/theme/bam.colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayServices extends StatelessWidget {
  const TodayServices({
    super.key,
    required this.noservis,
    required this.jebar,
    required this.tgl,
    required this.atn,
    required this.stat,
  });

  final String noservis;
  final String jebar;
  final String tgl;
  final String atn;
  final String stat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { Navigator.pushNamed(context, '/detail_services', arguments: noservis); },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: primary_color,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: accent_color,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      child: Text(
                        noservis,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: white_color,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: {
                          'Pending': yellow_color,
                          'On Progress': blue_color,
                          'Tunggu Konfirmasi': purple_color,
                          'Tdk Dpt Dikerjakan': black_color,
                          'Dibatalkan': red_color,
                          'Diambil': green_color,
                        }[stat]!,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      child: Text(
                        stat,
                        style: GoogleFonts.lato(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: white_color,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 13)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      jebar,
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: white_color,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tgl,
                      style: GoogleFonts.lato(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: white_color,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Text(
                      atn,
                      style: GoogleFonts.lato(
                        fontSize: 11,
            fontWeight: FontWeight.w600,
            color: white_color,
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
