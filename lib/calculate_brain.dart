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
    if (_bodyFat >= 30) {
      return 'Obesity';
    } else if (_bodyFat >= 25) {
      return 'OverWeight';
    } else if (_bodyFat >= 18) {
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

  String getInterpretationMale() {
    if (_bodyFat >= 30) {
      return 'You have body weight falls within the obesity range. '
          'It is recommended to consult a doctor for furthur evaluation and guidance';
    } else if (_bodyFat >= 25) {
      return 'You have higer than normal body weight. Try to exercise more.';
    } else if (_bodyFat > 18) {
      return 'You have normal body weight. Good job!';
    } else {
      return 'You have a normal body weight. You can eat bit more.';
    }
  }

  String getInterpretationFemale() {
    if (_bodyFat >= 38) {
      return 'You have body weight falls within the obesity range. '
          'It is recommended to consult a doctor for furthur evaluation and guidance';
    } else if (_bodyFat >= 32) {
      return 'You have higer than normal body weight. Try to exercise more.';
    } else if (_bodyFat > 25) {
      return 'You have normal body weight. Good job!';
    } else {
      return 'You have a normal body weight. You can eat bit more.';
    }
  }

  String getInterpretation() {
    if (gender == 0) {
      return getInterpretationFemale();
    } else {
      return getInterpretationMale();
    }
  }
}
