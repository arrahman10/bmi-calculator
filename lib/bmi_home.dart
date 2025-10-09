import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/provider/bmi_provider.dart';
import 'package:bmi_calculator/widgets/bmi_result.dart';
import 'package:bmi_calculator/widgets/bmi_slider.dart';

/// BMI Calculator main screen using Provider state management.
class BmiHome extends StatelessWidget {
  const BmiHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<BmiProvider>(
            builder: (context, provider, child) => BmiResult(
              bmi: provider.bmi,
              status: provider.status,
              color: provider.color,
            ),
          ),
          const SizedBox(height: 75),
          Consumer<BmiProvider>(
            builder: (context, provider, child) => BmiSlider(
              label: 'Height',
              unit: BmiUnit.m,
              sliderValue: provider.heightValue,
              sliderDivision: 100,
              sliderMax: 2.2,
              sliderMin: 1.2,
              onChange: provider.changeHeight,
            ),
          ),
          Consumer<BmiProvider>(
            builder: (context, provider, child) => BmiSlider(
              label: 'Weight',
              unit: BmiUnit.kg,
              sliderValue: provider.weightValue,
              sliderDivision: 200,
              sliderMax: 130.0,
              sliderMin: 30.0,
              onChange: provider.changeWeight,
            ),
          ),
        ],
      ),
    );
  }
}
