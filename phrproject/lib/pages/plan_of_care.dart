import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PlanOfCare extends StatelessWidget {
  const PlanOfCare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan of Care', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Plan of Care Overview',
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
                    BarChartGroupData(
                      x: 3,
                      barRods: [BarChartRodData(toY: 1, color: Colors.orange)],
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
                              return const Text('May 28');
                            case 2:
                              return const Text('June 1');
                            case 3:
                              return const Text('May 28');
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
                  PlanOfCareCard(
                    name: '1: Office consultation',
                    date: 'May 28, 2007',
                    instructions: 'Consultation with Dr. George Potomac for Asthma',
                  ),
                  PlanOfCareCard(
                    name: '2: Chest X-Ray',
                    date: 'June 1, 2007',
                    instructions: 'Arrive 15 minutes early, remove any metal accessories, and wear comfortable clothing.',
                  ),
                  PlanOfCareCard(
                    name: '3: Sputum Culture',
                    date: 'May 28, 2007',
                    instructions: 'Provide a deep cough sputum sample in the morning before eating or drinking.',
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

class PlanOfCareCard extends StatelessWidget {
  final String name;
  final String date;
  final String instructions;

  const PlanOfCareCard({
    super.key,
    required this.name,
    required this.date,
    required this.instructions,
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
              'Planned Date: $date',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Instructions: $instructions',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}