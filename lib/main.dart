import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputPage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF111111),
      ),
    );
  }
}
