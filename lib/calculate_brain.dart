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

  String getResultMale() {
    if (_bmi >= 30) {
      return 'Obesity';
    } else if (_bmi >= 24.9) {
      return 'OverWeight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getResultFemale() {
    if (_bodyFat >= 38) {
      return 'Obesity';
    } else if (_bodyFat >= 32) {
      return 'OverWeight';
    } else if (_bodyFat >= 25) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getResult() {
    if (gender == 0) {
      return getResultFemale();
    } else {
      return getResultMale();
    }
  }
}
