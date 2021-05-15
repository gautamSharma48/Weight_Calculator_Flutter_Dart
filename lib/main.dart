import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';

void main(){
  runApp(MaterialApp(
    title: 'BMI calculator',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.yellow,
      visualDensity: VisualDensity.adaptivePlatformDensity,

    ),
    home: Home(),
  ));
}