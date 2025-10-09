import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

/// Reusable slider widget for height and weight input in the BMI calculator.
class BmiSlider extends StatelessWidget {
  const BmiSlider({
    super.key,
    required this.label,
    required this.unit,
    required this.sliderValue,
    required this.sliderDivision,
    required this.sliderMax,
    required this.sliderMin,
    required this.onChange,
  });

  final String label;
  final BmiUnit unit;
  final double sliderValue;
  final int sliderDivision;
  final double sliderMax, sliderMin;
  final Function(double) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          // Label row: "Height 1.5 m"
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: txtLabelStyle),
              const SizedBox(width: 10),
              RichText(
                text: TextSpan(
                  text: sliderValue.toStringAsFixed(1),
                  style: txtValueStyle,
                  children: [
                    TextSpan(
                      text: ' ${unit.name}',
                      style: txtLabelStyle.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Actual Slider control
          Slider(
            activeColor: Colors.white70,
            inactiveColor: Colors.white30,
            label: sliderValue.toStringAsFixed(1),
            value: sliderValue,
            divisions: sliderDivision,
            max: sliderMax,
            min: sliderMin,
            onChanged: onChange,
          ),
        ],
      ),
    );
  }
}
