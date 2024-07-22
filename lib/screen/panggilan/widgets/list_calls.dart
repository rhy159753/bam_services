import 'package:flutter/material.dart';
import 'package:bamservices/theme/bam.colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ListCalls extends StatelessWidget {
  const ListCalls({
    super.key, 
    required this.id, 
    required this.lokasi, 
    required this.tanggal, 
    required this.teknisi,
    required this.status,
    });

  final String id;
  final String lokasi;
  final String tanggal;
  final String teknisi;
  final String status;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => { Navigator.pushNamed(context, '/detail_calls', arguments: id) },
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
                Text(
                  lokasi,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: white_color,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: {
                      'Pending': yellow_color,
                      'On The Way': blue_color,
                      'Tdk Dpt Dikerjakan': black_color,
                      'Dibatalkan': red_color,
                      'Selesai': green_color,
                    }[status]!,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: Text(
                    status,
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  tanggal,
                  style: GoogleFonts.lato(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: white_color,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Text(
                  '$teknisi',
                  style: GoogleFonts.lato(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
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
