import 'package:bamservices/theme/bam.constant.dart';
import 'package:flutter/material.dart';
import 'package:bamservices/screen/servisan/components/_keyword_search_section.dart';
import 'package:bamservices/theme/bam.colors.dart';

class ServisanSearchScreen extends StatefulWidget {
  const ServisanSearchScreen({super.key});

  @override
  State<ServisanSearchScreen> createState() => _ServisanSearchScreenState();
}

class _ServisanSearchScreenState extends State<ServisanSearchScreen> {
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
          child: ServicesSearch_Section(),
        ));
  }
}
