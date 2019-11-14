import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF111d6b),
        scaffoldBackgroundColor: Color(0xFF111d6b),
        accentColor: Color(0xCEA1556),
      )
    );
  }
}

