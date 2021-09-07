import 'package:bmical/constants/app_constants.dart';
import 'package:bmical/models/bmi_model.dart';
import 'package:bmical/screens/result.dart';
import 'package:bmical/widgets/left_bar.dart';
import 'package:bmical/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmi = 0;

  late BMImodel _bmiModel;

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
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: textColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height (cm)",
                        hintStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: textColor.withOpacity(.6))),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: textColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight (kg)",
                        hintStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: textColor.withOpacity(.6))),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmi = _w / ((_h / 100) * (_h / 100));

                  if (_bmi > 25) {
                    _bmiModel = BMImodel(
                        bmi: _bmi,
                        isNormal: false,
                        comments: "You\'re over weight!");
                  } else if (_bmi >= 18.5 && _bmi <= 25) {
                    _bmiModel = BMImodel(
                        bmi: _bmi,
                        isNormal: false,
                        comments: "You have normal weight");
                  } else {
                    _bmiModel = BMImodel(
                        bmi: _bmi,
                        isNormal: false,
                        comments: "You\'re under weight");
                  }
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultScreen(
                    bmiModel: _bmiModel,
                  );
                }));
              },
              child: Container(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Oswald-Medium',
                      fontWeight: FontWeight.bold,
                      color: accentHexColor),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 10,
            ),
            RightBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            RightBar(barWidth: 75),
            SizedBox(
              height: 20,
            ),
            RightBar(barWidth: 35),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 30),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 50)
          ],
        ),
      ),
    );
  }
}
