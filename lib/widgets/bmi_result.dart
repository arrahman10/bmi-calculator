import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
          width: 215,
          height: 215,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 10),
          ),
          child: Text(
            bmi.toStringAsFixed(1),
            style: txtValueStyle.copyWith(fontSize: 60),
          ),
        ),
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: AutoSizeText(
              status,
              style: txtResultStyle,
              maxLines: 1,
              minFontSize: 20,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
