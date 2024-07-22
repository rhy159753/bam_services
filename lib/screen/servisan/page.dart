import 'package:bamservices/theme/bam.constant.dart';
import 'package:flutter/material.dart';
import 'package:bamservices/screen/servisan/components/services_section.dart';
import 'package:bamservices/theme/bam.colors.dart';

class ServisanScreen extends StatefulWidget {
  const ServisanScreen({super.key});

  @override
  State<ServisanScreen> createState() => _ServisanScreenState();
}

class _ServisanScreenState extends State<ServisanScreen> {
  @override
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
          child: Services_Section(),
        ));
  }
}
