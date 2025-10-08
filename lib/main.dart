import 'package:flutter/material.dart';

import 'package:bmi_calculator/bmi_home.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget of the BMI Calculator app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const BmiHome(),
    );
  }
}
