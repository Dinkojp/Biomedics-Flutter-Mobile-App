import 'package:flutter/material.dart';

class Demographics extends StatelessWidget {
  const Demographics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demographics', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          DemographicsCard(
            firstName: 'Ellen',
            lastName: 'Ross',
            gender: 'Female',
            maritalStatus: 'Married',
            religiousAffiliation: 'Christian',
            ethnicity: 'Asian',
            languageSpoken: 'English',
            address: '17 Daws Road, Portland, OR 97006',
            telephone: '415-555-1229',
            birthday: 'March 7, 1960',
          ),
        ],
      ),
    );
  }
}

class DemographicsCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String gender;
  final String maritalStatus;
  final String religiousAffiliation;
  final String ethnicity;
  final String languageSpoken;
  final String address;
  final String telephone;
  final String birthday;

  const DemographicsCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.maritalStatus,
    required this.religiousAffiliation,
    required this.ethnicity,
    required this.languageSpoken,
    required this.address,
    required this.telephone,
    required this.birthday,
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
              '$firstName $lastName',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Gender: $gender',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Marital Status: $maritalStatus',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Religious Affiliation: $religiousAffiliation',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Ethnicity: $ethnicity',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Language Spoken: $languageSpoken',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Address: $address',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Telephone: $telephone',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Birthday: $birthday',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}