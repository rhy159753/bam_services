
import 'package:bamservices/screen/dashboard/components/today_services_section.dart';
import 'package:flutter/material.dart';
import 'package:bamservices/theme/bam.colors.dart';
import 'package:bamservices/theme/bam.constant.dart';

import 'package:bamservices/screen/dashboard/components/new_calls_section.dart';
import 'package:bamservices/screen/dashboard/components/search_section.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  
  @override
  Widget build(BuildContext context) {
  var _width = ResponsiveDimension.screenWidth(context);
  var _height = ResponsiveDimension.screenHeight(context);
    return Scaffold(
      backgroundColor: black_color,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: _width,
        height: _height,
        padding: const EdgeInsets.fromLTRB(30, 75, 30, 0),
        child: Column(
          children: [
            Search_Section(),
            New_Calls_Section(),
            Today_Services_Section()
            ],
        ),
      ),
    );
  }
}
