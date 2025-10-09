import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bmi_calculator/bmi_home.dart';
import 'package:bmi_calculator/provider/bmi_provider.dart';

/// Entry point of the BMI Calculator app (Provider version).
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BmiProvider(),
      child: const MyApp(),
    ),
  );
}

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
