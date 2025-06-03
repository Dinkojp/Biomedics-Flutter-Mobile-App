import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Procedures extends StatelessWidget {
  const Procedures({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Procedures', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Procedures Overview',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              flex: 2,
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(
                      x: 1,
                      barRods: [BarChartRodData(toY: 1, color: Colors.blue)],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [BarChartRodData(toY: 1, color: Colors.green)],
                    ),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 1:
                              return const Text('Sep 28 2002');
                            case 2:
                              return const Text('Mar 22 2002');
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                ),
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
                  ProcedureCard(
                    date: 'September 28, 2002',
                    type: 'Surgical',
                    name: '1: Laparoscopic Cholecystectomy',
                    instructions: 'Performed by Dr. Bala Venktaraman at Ashby Medical Center.',
                    provider: 'Dr. Bala Venktaraman',
                    location: 'Ashby Medical Center',
                  ),
                  ProcedureCard(
                    date: 'March 22, 2002',
                    type: 'Surgical',
                    name: '2: Cesarian Section',
                    instructions: 'Performed by Dr. Tiffany Martinez at Ashby Medical Center.',
                    provider: 'Dr. Tiffany Martinez',
                    location: 'Ashby Medical Center',
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

class ProcedureCard extends StatelessWidget {
  final String date;
  final String type;
  final String name;
  final String instructions;
  final String provider;
  final String location;

  const ProcedureCard({
    super.key,
    required this.date,
    required this.type,
    required this.name,
    required this.instructions,
    required this.provider,
    required this.location,
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
              'Provider: $provider',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Location: $location',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}