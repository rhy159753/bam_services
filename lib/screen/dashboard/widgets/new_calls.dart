import 'package:flutter/material.dart';
import 'package:bamservices/theme/bam.colors.dart';
import 'package:google_fonts/google_fonts.dart';

class NewCalls extends StatelessWidget {
  const NewCalls({
    super.key,
    required this.id,
    required this.lokasi,
    required this.teknisi,
    required this.status,
    });

  final String id;
  final String lokasi;
  final String teknisi;
  final String status;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { Navigator.pushNamed(context, '/detail_calls', arguments: id); },
      child: Container(
        width: 194,
        height: 200,
        decoration: BoxDecoration(
          color: {
            'Pending': yellow_color,
            'On The Way': blue_color,
            'Tdk Dpt Dikerjakan': black_color,
            'Dibatalkan': red_color,
            'Selesai': green_color,
          }[status]!,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: white_color,
            width: 2,
          )
        ),
        margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              lokasi,
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: white_color,
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 13)),
            Text(
              teknisi,
              style: GoogleFonts.lato(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: white_color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
