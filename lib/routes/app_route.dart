import 'package:bamservices/screen/panggilan/search.dart';
import 'package:bamservices/screen/panggilan/update.dart';
import 'package:bamservices/screen/servisan/search.dart';
import 'package:bamservices/screen/servisan/update.dart';
import 'package:flutter/material.dart';
import 'package:bamservices/screen/dashboard_active.dart';
import 'package:bamservices/screen/info_active.dart';
import 'package:bamservices/screen/panggilan_active.dart';
import 'package:bamservices/screen/servisan_active.dart';

import 'package:bamservices/screen/panggilan/detail.dart';

import 'package:bamservices/screen/panggilan/insert.dart';
import 'package:bamservices/screen/servisan/detail.dart';
import 'package:bamservices/screen/servisan/insert.dart';


final Map<String, WidgetBuilder> routes = {
  '/dashboard': (BuildContext context) => DashboardPage(),
  '/servisan/search': (BuildContext context) => ServisanSearchScreen(),
  '/servisan/update': (BuildContext context) => UpdateServisanScreen(),
  '/servisan': (BuildContext context) => ServisanPage(),
  '/panggilan': (BuildContext context) => PanggilanPage(),
  '/panggilan/search': (BuildContext context) => PanggilanSearchScreen(),
  '/panggilan/update': (BuildContext context) => UpdatePanggilanScreen(),
  '/info': (BuildContext context) => InfoPage(),
  '/detail_services': (BuildContext context) => DetailServisanScreen(),
  '/detail_calls': (BuildContext context) => DetailPanggilanScreen(),
  '/insert_calls': (BuildContext context) => InsertPanggilanScreen(),
  '/insert_services': (BuildContext context) => InsertServisanScreen(),
};