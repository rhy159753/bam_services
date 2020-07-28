import 'package:flutter/material.dart';

const cBackgroundColor1 = Color(0xFFF98700);
const cBackgroundColor2 = Color(0xFF000000);
const cBackgroundColor3 = Color(0xFFFFFFFF);
const cTextColor1 = Color(0xFF000000);
const cTextColor2 = Color(0xFFFFFFFF);
const cTextColor3 = Color(0xFFA9A9A9);
const cTextCond1 = Color(0xFFF90000);
const cTextCond2 = Color(0xFF0055F9);
const cTextCond3 = Color(0xFF00BB07);

int cDefaultPadding = 20;

/// Get Device with
double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Get Device Height
double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
