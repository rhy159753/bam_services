import 'package:bamservices/model/card.servisan.dart';
import 'package:bamservices/model/env.dart';
import 'package:flutter/material.dart';
import 'package:bamservices/theme/bam.colors.dart';
import 'package:bamservices/theme/bam.constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bamservices/screen/dashboard/widgets/today_services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Today_Services_Section extends StatelessWidget {
  const Today_Services_Section({super.key});

  @override
  Widget build(BuildContext context) {
    var _height = ResponsiveDimension.screenHeight(context);
    return Column(children: [
      Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Barang Masuk Hari Ini",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: white_color,
                )),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        height: _height * 0.42,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                ListServices()
              ]),
        ),
      ),
    ]);
  }
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

class ListServices extends StatelessWidget {
  const ListServices({super.key});

  Future<List<Servisan>> _getServisan() async {
    final response = await http.get(Uri.parse(Env.API_URL + 'servisan/latest7'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Servisan.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Servisan>>(
      future: _getServisan(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Servisan>? data = snapshot.data;
          return Column(
            children: data!.map((servisan) => TodayServices(
              noservis: servisan.noserv,
              atn: servisan.atn,
              jebar: servisan.jebar,
              stat: servisan.stat,
              tgl: servisan.wkt_dtg,
              )).toList(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Column(
          children: [
            ListServicesSkeleton()
          ],
        );
      },
    );
  }
}

class ListServicesSkeleton extends StatelessWidget {
  const ListServicesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkeletonServices(),
        SkeletonServices(),
        SkeletonServices(),
        SkeletonServices(),
      ],
    );
  }
}
