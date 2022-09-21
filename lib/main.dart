import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliverappbar/mycalculator.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black
  )

  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Calculator",
    home: MyCalculator(),

  ));
}

