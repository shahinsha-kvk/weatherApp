class WeatherReport {
  final String location;
  final double temperature;
  final String condition;

  WeatherReport({
    required this.location,
    required this.temperature,
    required this.condition,
  });

  factory WeatherReport.fromJson(Map<String, dynamic> json) {
    return WeatherReport(
      location: json['location'] as String,
      temperature: json['temperature'] as double,
      condition: json['condition'] as String,
    );
  }
}
