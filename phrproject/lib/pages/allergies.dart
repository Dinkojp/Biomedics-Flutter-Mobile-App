import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Allergies extends StatefulWidget {
  const Allergies({super.key});

  @override
  State<Allergies> createState() => _AllergiesState();
}

class _AllergiesState extends State<Allergies> {
  List<dynamic> allergies = [];

  @override
  void initState() {
    super.initState();
    loadAllergies();
  }

  Future<void> loadAllergies() async {
    final String response = await rootBundle.loadString('lib/assets/allergies.json');
    final data = json.decode(response);
    setState(() {
      allergies = data['allergies'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Allergies', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: allergies.length,
        itemBuilder: (context, index) {
          final allergy = allergies[index];
          return AllergyCard(
            name: allergy['name'],
            reaction: allergy['reaction'],
            severity: allergy['severity'],
          );
        },
      ),
    );
  }
}

class AllergyCard extends StatelessWidget {
  final String name;
  final String reaction;
  final String severity;

  const AllergyCard({
    super.key,
    required this.name,
    required this.reaction,
    required this.severity,
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
              'Reaction: $reaction',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Severity: $severity',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}