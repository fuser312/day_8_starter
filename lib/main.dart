import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF2d2e38),
        scaffoldBackgroundColor: Color(0xFF2d2e38),
        accentColor: Color(0xFFEA1556),
      )
    );
  }
}

