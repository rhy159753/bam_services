import 'package:flutter/material.dart';
import 'package:bamservices/theme/bam.colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bamservices/screen/dashboard/widgets/new_calls.dart';
import 'package:shimmer/shimmer.dart';
import 'package:bamservices/model/card.panggilan.dart';
import 'package:bamservices/model/env.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class New_Calls_Section extends StatelessWidget {
  const New_Calls_Section({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Panggilan Terbaru",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: white_color,
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 17),
            ),
            Container(
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ListCalls(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class SkeletonCalls extends StatelessWidget {
  const SkeletonCalls({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 194,
      height: 200,
      child: Shimmer.fromColors(
        baseColor: grey_color,
        highlightColor: white_color,
        child: Container(
          width: 194,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 13)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListCalls extends StatelessWidget {
  const ListCalls({super.key});

  Future<List<Panggilan>> _getPanggilan() async {
    final response = await http.get(Uri.parse(Env.API_URL + 'panggilan/latest5'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Panggilan.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPanggilan(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Panggilan> data = snapshot.data as List<Panggilan>;
          return Row(
            children: [
              for (var i = 0; i < data.length; i++)
                NewCalls(
                  id: data[i].id_pgl,
                  lokasi: data[i].lok,
                  teknisi: data[i].id_tek,
                  status: data[i].stat,
                ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Row(
          children: [
            ListCallsSkeleton(),
          ],
        );
      },
      );
  }
}

class ListCallsSkeleton extends StatelessWidget {
  const ListCallsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SkeletonCalls(),
        SkeletonCalls(),
        SkeletonCalls(),
        SkeletonCalls(),
      ],
    );
  }
}
