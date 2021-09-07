import 'package:bmical/constants/app_constants.dart';
import 'package:bmical/widgets/left_bar.dart';
import 'package:bmical/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;

  ResultScreen({this.bmiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              color: accentHexColor, fontSize: 20, fontFamily: 'Oswald-Blod'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                child: Text(
                  "YOUR RESULT",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: textColor),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                child: Text(
              bmiModel.bmi.toStringAsFixed(2),
              style: TextStyle(
                  fontFamily: 'Oswald-Medium',
                  fontSize: 90,
                  color: accentHexColor),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  bmiModel.comments,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: textColor),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(barWidth: 75),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 35),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 85),
            SizedBox(
              height: 20,
            ),
            RightBar(barWidth: 30),
            SizedBox(
              height: 20,
            ),
            RightBar(barWidth: 50),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 55),
            SizedBox(
              height: 30,
            ),
            RightBar(barWidth: 85),
          ],
        ),
      ),
    );
  }
}
