import 'package:flutter/material.dart';

import './calculator_screen/calculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Calculator UI',
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20.0
          ),
          headline2: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 50.0
          ),
        ),
      ),
      home: CalCulatorScreen(),
    );
  }
}
