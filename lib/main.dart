import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 1500,
        splash: 'images/start_image.png',
        nextScreen: InputPage(),
        splashTransition: SplashTransition.slideTransition,
        backgroundColor: Colors.black,
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF111111),
      ),
    );
  }
}
