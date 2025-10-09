import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

/// Manages BMI calculation, status, and color using ChangeNotifier.
/// Listeners are notified on height/weight updates to rebuild dependent widgets.
class BmiProvider extends ChangeNotifier {
  double _heightValue = 1.5;
  double _weightValue = 50.0;
  String _status = '';
  double _bmi = 0.0;
  Color _color = Colors.green;

  double get heightValue => _heightValue;

  double get weightValue => _weightValue;

  String get status => _status;

  double get bmi => _bmi;

  Color get color => _color;

  BmiProvider() {
    _updateBmi();
  }

  /// Updates height and recalculates BMI.
  void changeHeight(double value) {
    _heightValue = value;
    _updateBmi();
    notifyListeners();
  }

  /// Updates weight and recalculates BMI.
  void changeWeight(double value) {
    _weightValue = value;
    _updateBmi();
    notifyListeners();
  }

  /// Calculates BMI and updates dependent values.
  void _updateBmi() {
    _bmi = weightValue / (heightValue * heightValue);
    _updateStatus();
    _updateColor();
  }

  void _updateStatus() {
    _status = _getStatus();
  }

  /// Returns BMI category text based on calculated value.
  String _getStatus() {
    if (bmi < 16.0) return BMI.underweightSevere;
    if (bmi >= 16.0 && bmi <= 16.9) return BMI.underweightModerate;
    if (bmi >= 17.0 && bmi <= 18.4) return BMI.underweightMild;
    if (bmi >= 18.5 && bmi <= 24.9) return BMI.normal;
    if (bmi >= 25.0 && bmi <= 29.9) return BMI.overweightPre;
    if (bmi >= 30.0 && bmi <= 34.9) return BMI.obese_1;
    if (bmi >= 35.0 && bmi <= 39.9) return BMI.obese_2;
    return BMI.obese_3;
  }

  void _updateColor() {
    if (bmi < 16.0) {
      _color = Colors.green.shade100;
    } else if (bmi >= 16.0 && bmi <= 16.9) {
      _color = Colors.green.shade200;
    } else if (bmi >= 17.0 && bmi <= 18.4) {
      _color = Colors.green.shade300;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      _color = Colors.green;
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      _color = Colors.red.shade400;
    } else if (bmi >= 30.0 && bmi <= 34.9) {
      _color = Colors.red.shade500;
    } else if (bmi >= 35.0 && bmi <= 39.9) {
      _color = Colors.red.shade600;
    } else {
      _color = Colors.red.shade900;
    }
  }
}
