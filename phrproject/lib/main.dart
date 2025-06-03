import 'package:flutter/material.dart';
import 'package:phrproject/pages/allergies.dart';
import 'package:phrproject/pages/demographics.dart';
import 'package:phrproject/pages/immunizations.dart';
import 'package:phrproject/pages/medication.dart';
import 'package:phrproject/pages/plan_of_care.dart';
import 'package:phrproject/pages/problem_list.dart';
import 'package:phrproject/pages/procedures.dart';
import 'package:phrproject/screens/splash_screen.dart';
import 'package:phrproject/pages/heart_rate_calculator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/demographics': (context) => const Demographics(),
        '/allergies': (context) => const Allergies(),
        '/immunizations': (context) => const Immunizations(),
        '/medication': (context) => const Medication(),
        '/plan_of_care': (context) => const PlanOfCare(),
        '/problem_list': (context) => const ProblemList(),
        '/procedures': (context) => const Procedures(),
        '/heart_rate_calculator': (context) => const HeartRateHomePage(),
      },
    );
  }
}
