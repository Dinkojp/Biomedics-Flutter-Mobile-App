import 'package:flutter/material.dart';

class Immunizations extends StatelessWidget {
  const Immunizations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Immunizations', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ImmunizationCard(
            date: 'May 2001',
            name: 'Influenza virus vaccine, IM',
            type: 'Intramuscular injection',
            dose: '50 / mcg',
            instructions: 'Possible flu-like symptoms for three days',
          ),
          ImmunizationCard(
            date: 'April 2000',
            name: 'Tetanus and diphtheria toxoids, IM',
            type: 'Intramuscular injection',
            dose: '50 / mcg',
            instructions: 'Mild pain or soreness in the local area',
          ),
        ],
      ),
    );
  }
}

class ImmunizationCard extends StatelessWidget {
  final String date;
  final String name;
  final String type;
  final String dose;
  final String instructions;

  const ImmunizationCard({
    super.key,
    required this.date,
    required this.name,
    required this.type,
    required this.dose,
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
              'Dose Quantity: $dose',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Education/Instructions: $instructions',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}