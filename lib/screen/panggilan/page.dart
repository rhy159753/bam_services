import 'package:bamservices/screen/panggilan/components/calls_section.dart';
import 'package:bamservices/theme/bam.colors.dart';
import 'package:bamservices/theme/bam.constant.dart';
import 'package:flutter/material.dart';

class PanggilanScreen extends StatefulWidget {
  const PanggilanScreen({super.key});

  @override
  State<PanggilanScreen> createState() => _PanggilanScreenState();
}

class _PanggilanScreenState extends State<PanggilanScreen> {
  
  Widget build(BuildContext context) {
    var _width = ResponsiveDimension.screenWidth(context);
    var _height = ResponsiveDimension.screenHeight(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: black_color,
        body: Container(
          width: _width,
          height: _height,
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
          child: Calls_Section(),
        ));
  }
}