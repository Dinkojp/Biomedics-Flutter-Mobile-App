import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Medication extends StatelessWidget {
  const Medication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medications', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Medications Overview',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Text(
                    'Acetaminophen with codeine',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: BarChart(
                      BarChartData(
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(toY: 2, color: Colors.blue), // Dose Quantity
                              BarChartRodData(toY: 1, color: Colors.green), // Rate Quantity
                            ],
                          ),
                        ],
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                if ([0, 1, 2].contains(value.toInt())) {
                                  return Text(value.toInt().toString());
                                }
                                return const Text('');
                              },
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Text(
                    'Indomethacin',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: BarChart(
                      BarChartData(
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(toY: 50, color: Colors.blue), // Dose Quantity
                              BarChartRodData(toY: 2, color: Colors.green), // Rate Quantity
                            ],
                          ),
                        ],
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                if ([0, 10, 20, 30, 40, 50].contains(value.toInt())) {
                                  return Text(value.toInt().toString());
                                }
                                return const Text('');
                              },
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              flex: 3,
              child: ListView(
                children: const [
                  MedicationCard(
                    date: 'March 28, 2005',
                    type: 'Liquid',
                    name: 'Acetaminophen with codeine',
                    instructions: '2 puffs once a day',
                    dose: '2 / puffs',
                    rate: '1 / day',
                    prescriber: 'Ashby Medical Center',
                  ),
                  MedicationCard(
                    date: 'December 10, 2003',
                    type: 'Tablet',
                    name: 'Indomethacin',
                    instructions: '50mg bid with food',
                    dose: '50 / mg',
                    rate: '2 / day',
                    prescriber: 'Ashby Medical Center',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicationCard extends StatelessWidget {
  final String date;
  final String type;
  final String name;
  final String instructions;
  final String dose;
  final String rate;
  final String prescriber;

  const MedicationCard({
    super.key,
    required this.date,
    required this.type,
    required this.name,
    required this.instructions,
    required this.dose,
    required this.rate,
    required this.prescriber,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Date: $date',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Type: $type',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Instructions: $instructions',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Dose Quantity: $dose',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Rate Quantity: $rate',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Name of Prescriber: $prescriber',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}