import 'package:bamservices/theme/bam.constant.dart';
import 'package:flutter/material.dart';
import 'package:bamservices/screen/panggilan/components/_keyword_search_section.dart';
import 'package:bamservices/theme/bam.colors.dart';

class PanggilanSearchScreen extends StatefulWidget {
  const PanggilanSearchScreen({super.key});

  @override
  State<PanggilanSearchScreen> createState() => _PanggilanSearchScreenState();
}

class _PanggilanSearchScreenState extends State<PanggilanSearchScreen> {
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
          child: CallsSearch_Section(),
        ));
  }
}
