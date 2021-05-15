import 'package:flutter/material.dart';
import 'package:weight_meter/constants/app_constants.dart';
import 'package:weight_meter/widgets/left_bar.dart';
import 'package:weight_meter/widgets/right_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiresult = 0;
  String _textResult = "";

  Size size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accentHexcolor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              child: Text("Height in Foot & Weight in Kilogram " ,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [



                Container(
                  width: size.width/3,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexcolor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                ),

                Container(
                  child: Text(
                    "FT"
                    ,style: TextStyle(
                    fontSize: 20,
                    color: accentHexcolor,
                    fontWeight: FontWeight.w300,
                  ),),

                ),
                Container(
                  width: size.width/3,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexcolor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                ),

                   Container(
                    child: Text(
                      "KG"
                      ,style: TextStyle(
                      fontSize: 20,
                      color: accentHexcolor,
                      fontWeight: FontWeight.w300,
                    ),),


                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),


            GestureDetector(
              onTap: (){
                double _h=double.parse(_heightController.text);
                double _w=double.parse(_weightController.text);

                


                setState(() {

                  double _type=_h/3.281;
                  _bmiresult = _w / (_type * _type);

                  if (_bmiresult >= 25) {
                    _textResult = "you are over weight";
                  } else if (_bmiresult >= 18.5 && _bmiresult <= 24.9) {
                    _textResult = "You have normal Weight";
                  } else {
                    _textResult = "You are under Weight";
                  }
                });
              },
              child: Container(
                child: Text("Calculate",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: accentHexcolor)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(_bmiresult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90, color: accentHexcolor)),
            ),
            SizedBox(
              height: 30,
            ),

              Visibility(
                visible: _textResult.isNotEmpty,
                child: Container(
                  child: Text(_textResult,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: accentHexcolor)),
                ),
              ),


            SizedBox(height: 10),
            LeftBar(barWidth: 40),
            SizedBox(height: 10),
            LeftBar(barWidth: 70),
            SizedBox(height: 10),
            LeftBar(barWidth: 40),
            SizedBox(height: 20),
            RightBar(barWidth: 70),
            SizedBox(height: 20),
            RightBar(barWidth: 70),
          ],
        ),
      ),
    );
  }
}
