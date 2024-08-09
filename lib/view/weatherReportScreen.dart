// lib/view/weatherReportScreen.dart
import 'package:flutter/material.dart';

import '../model/weatherReportMode;.dart';

class WeatherReportScreen extends StatelessWidget {
  final List<WeatherReport> weatherReports;

  WeatherReportScreen({required this.weatherReports});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Reports'),
      ),
      body: ListView.builder(
        itemCount: weatherReports.length,
        itemBuilder: (context, index) {
          final report = weatherReports[index];
          return ListTile(
            title: Text(report.location),
            subtitle: Text('Temperature: ${report.temperature}°C'),
            // Display other details
          );
        },
      ),
    );
  }
}
