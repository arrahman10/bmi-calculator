import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

/// Reusable widget to display the calculated BMI value and its status.
///
/// Shows a circular bordered container with animated color transition
/// and a result text below (e.g., Normal, Overweight, etc.).
class BmiResult extends StatelessWidget {
  final Color color;
  final double bmi;
  final String status;

  const BmiResult({
    super.key,
    required this.color,
    required this.bmi,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          alignment: Alignment.center,
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 10),
          ),
          child: Text(
            bmi.toStringAsFixed(1),
            style: txtValueStyle.copyWith(fontSize: 60),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(status, style: txtResultStyle),
        ),
      ],
    );
  }
}
