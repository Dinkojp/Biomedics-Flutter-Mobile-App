import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProblemList extends StatelessWidget {
  const ProblemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Problem List', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Problem List Overview',
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
                              return const Text('March 28 2005');
                            case 2:
                              return const Text('September 2002');
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
                  ProblemListCard(
                    observation: '1: Ankle Sprain',
                    status: 'Active',
                    date: 'March 28, 2005',
                    comments: 'Slipped on ice and fell.',
                  ),
                  ProblemListCard(
                    observation: '2: Cholecystitis',
                    status: 'Resolved',
                    date: 'September 28, 2002',
                    comments: 'Surgery postponed until after delivery.',
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

class ProblemListCard extends StatelessWidget {
  final String observation;
  final String status;
  final String date;
  final String comments;

  const ProblemListCard({
    super.key,
    required this.observation,
    required this.status,
    required this.date,
    required this.comments,
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
              observation,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Status: $status',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Date: $date',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Comments: $comments',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}