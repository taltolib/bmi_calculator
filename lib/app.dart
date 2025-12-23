
import 'package:flutter/material.dart';
import 'package:bmi_calculator/calculator/calculator_page.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    );
  }
}
