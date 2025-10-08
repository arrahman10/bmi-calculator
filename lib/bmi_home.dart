import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/bmi_result.dart';
import 'package:bmi_calculator/widgets/bmi_slider.dart';

/// Main screen of the BMI Calculator (Stateful version).
/// Displays two sliders for height and weight input.
class BmiHome extends StatefulWidget {
  const BmiHome({super.key});

  @override
  State<BmiHome> createState() => _BmiHomeState();
}

class _BmiHomeState extends State<BmiHome> {
  double heightValue = 1.5;
  double weightValue = 50.0;
  String status = '';
  double bmi = 0.0;
  Color color = Colors.green;

  @override
  void initState() {
    super.initState();
    _updateBmi(); // Initial BMI calculation on widget load
  }

  /// Calculates BMI and triggers corresponding status and color updates.
  void _updateBmi() {
    bmi = weightValue / (heightValue * heightValue);
    _updateStatus();
    _updateColor();
  }

  /// Updates the BMI category text based on the current BMI value.
  void _updateStatus() {
    status = _getStatus();
  }

  /// Returns the BMI status label according to WHO classification.
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

  /// Updates the result circle color depending on BMI range.
  void _updateColor() {
    if (bmi < 16.0) {
      color = Colors.green.shade100;
    } else if (bmi >= 16.0 && bmi <= 16.9) {
      color = Colors.green.shade200;
    } else if (bmi >= 17.0 && bmi <= 18.4) {
      color = Colors.green.shade300;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      color = Colors.green;
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      color = Colors.red.shade400;
    } else if (bmi >= 30.0 && bmi <= 34.9) {
      color = Colors.red.shade500;
    } else if (bmi >= 35.0 && bmi <= 39.9) {
      color = Colors.red.shade600;
    } else {
      color = Colors.red.shade900;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BmiResult(bmi: bmi, status: status, color: color),
          const SizedBox(height: 100),
          BmiSlider(
            label: 'Height',
            unit: BmiUnit.m,
            sliderValue: heightValue,
            sliderDivision: 100,
            sliderMax: 2.2,
            sliderMin: 1.2,
            onChange: (newValue) {
              setState(() {
                heightValue = newValue;
              });
              _updateBmi(); // Recalculate BMI after height change
            },
          ), // BmiSlider
          BmiSlider(
            label: 'Weight',
            unit: BmiUnit.kg,
            sliderValue: weightValue,
            sliderDivision: 200,
            sliderMax: 130.0,
            sliderMin: 30.0,
            onChange: (newValue) {
              setState(() {
                weightValue = newValue;
              });
              _updateBmi(); // Recalculate BMI after weight change
            },
          ), // BmiSlider
        ],
      ),
    );
  }
}
