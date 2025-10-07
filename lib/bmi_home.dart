import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BmiSlider(
            label: 'Height',
            unit: BmiUnit.m,
            sliderValue: heightValue,
            sliderDivision: 100,
            sliderMax: 2.2,
            sliderMin: 1.2,
            onChange: (newValue) {
              setState(() => heightValue = newValue);
            },
          ),
          const SizedBox(height: 5),
          BmiSlider(
            label: 'Weight',
            unit: BmiUnit.kg,
            sliderValue: weightValue,
            sliderDivision: 200,
            sliderMax: 130.0,
            sliderMin: 30.0,
            onChange: (newValue) {
              setState(() => weightValue = newValue);
            },
          ),
          const SizedBox(height: 75),
        ],
      ),
    );
  }
}
