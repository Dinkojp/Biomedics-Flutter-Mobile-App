import 'package:flutter/material.dart';

class HeartRateHomePage extends StatefulWidget {
  const HeartRateHomePage({super.key});

  @override
  State<HeartRateHomePage> createState() => _HeartRateHomePageState();
}

class _HeartRateHomePageState extends State<HeartRateHomePage> {
  final TextEditingController ageController = TextEditingController();
  String selectedIntensity = 'Mild';
  String result = '';

  void calculateHeartRate() {
    final int? age = int.tryParse(ageController.text);
    if (age == null || age <= 0) {
      setState(() {
        result = 'Please enter a valid age.';
      });
      return;
    }

    final int maxHeartRate = 220 - age;
    double lowerBound = 0;
    double upperBound = 0;

    switch (selectedIntensity) {
      case 'Mild':
        lowerBound = maxHeartRate * 0.50;
        upperBound = maxHeartRate * 0.60;
        break;
      case 'Moderate':
        lowerBound = maxHeartRate * 0.60;
        upperBound = maxHeartRate * 0.70;
        break;
      case 'Intense':
        lowerBound = maxHeartRate * 0.70;
        upperBound = maxHeartRate * 0.85;
        break;
    }

    setState(() {
      result =
      'Target Heart Rate Zone: ${lowerBound.toInt()} - ${upperBound.toInt()} bpm';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Target Heart Rate Calculator', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your age:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'e.g., 25',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select exercise intensity:',
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton<String>(
              value: selectedIntensity,
              items: const [
                DropdownMenuItem(value: 'Mild', child: Text('Mild')),
                DropdownMenuItem(value: 'Moderate', child: Text('Moderate')),
                DropdownMenuItem(value: 'Intense', child: Text('Intense')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedIntensity = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateHeartRate,
              child: const Text('Calculate', ),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}