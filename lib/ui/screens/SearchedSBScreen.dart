import 'package:flutter/material.dart';
import 'package:bam_services/ui/constant/constant.dart';

class SearchedSBScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: cBackgroundColor1,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text("Pencarian"),
        ),
        body: Container(
          alignment: Alignment.bottomLeft,
          width: deviceWidth(context),
          color: cBackgroundColor2,
          padding: EdgeInsets.fromLTRB(deviceWidth(context) * 0.054,
              deviceWidth(context) * 0.092, deviceWidth(context) * 0.054, 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Pencarian : ",
                    style: TextStyle(
                        color: cTextColor2, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "SB - 99999",
                    style: TextStyle(
                        color: cTextColor2, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              // Table
              Container(
                width: deviceWidth(context),
                margin: EdgeInsets.only(top: deviceHeight(context) * 0.033),
                color: cBackgroundColor3,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: deviceWidth(context) * 0.3,
                        child: Text("No Servis"),
                      ),
                      Container(
                        width: deviceWidth(context) * 0.52,
                        child: Text("SB - 99999"),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: deviceWidth(context),
                color: cBackgroundColor3,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: deviceWidth(context) * 0.3,
                        child: Text("Jenis Barang"),
                      ),
                      Container(
                        width: deviceWidth(context) * 0.52,
                        child: Text("Printer Canon MP 287"),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: deviceWidth(context),
                color: cBackgroundColor3,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: deviceWidth(context) * 0.3,
                        child: Text("Aksesoris"),
                      ),
                      Container(
                        width: deviceWidth(context) * 0.52,
                        child: Text("-"),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: deviceWidth(context),
                color: cBackgroundColor3,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: deviceWidth(context) * 0.3,
                        child: Text("Nama"),
                      ),
                      Container(
                        width: deviceWidth(context) * 0.52,
                        child: Text("Fulan bin Fulan"),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: deviceWidth(context),
                color: cBackgroundColor3,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: deviceWidth(context) * 0.3,
                        child: Text("Keluhan"),
                      ),
                      Container(
                        width: deviceWidth(context) * 0.52,
                        child: Text(
                            "Gak mau ngeprint, sebelumnya habis kena genjutsu Tsukuyomi"),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: deviceWidth(context),
                color: cBackgroundColor3,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: deviceWidth(context) * 0.3,
                        child: Text("Status"),
                      ),
                      Container(
                        width: deviceWidth(context) * 0.52,
                        child: Text(
                          "Belum Selesai",
                          style: TextStyle(color: cTextCond1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: deviceWidth(context),
                color: cBackgroundColor3,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: deviceWidth(context) * 0.3,
                        child: Text("Keterangan"),
                      ),
                      Container(
                        width: deviceWidth(context) * 0.52,
                        child: Text("-"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
