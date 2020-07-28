import 'package:bam_services/ui/screens/SearchedSBScreen.dart';
import 'package:flutter/material.dart';
import 'package:bam_services/ui/constant/constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomLeft,
        width: deviceWidth(context),
        color: cBackgroundColor1,
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: deviceHeight(context) * 0.11),
                child: Image(image: AssetImage("assets/logo/bam.png")),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              width: deviceWidth(context),
              padding: EdgeInsets.only(left: 20, right: 20),
              margin: EdgeInsets.only(top: deviceHeight(context) * 0.17),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin:
                        EdgeInsets.only(bottom: deviceHeight(context) * 0.021),
                    child: Text(
                      "No Servis",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "SB - XXXXX",
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(top: deviceHeight(context) * 0.021),
                    child: RaisedButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        child: Icon(Icons.search),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SearchedSBScreen();
                          }));
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
