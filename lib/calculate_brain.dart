import 'dart:math';

class CalculateBrain {
  CalculateBrain({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });

  final int height;
  final int weight;
  final int age;
  final int? gender;

  late double _bmi;
  late double _bodyFat;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String calculateBodyFat() {
    _bodyFat = (1.2 * _bmi) + (0.23 * age) - (10.8 * gender!) - 5.4;

    return _bodyFat.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 35.0) {
      return 'Extremely Obese';
    } else if (_bmi >= 30.0) {
      return 'Obesity';
    } else if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}
