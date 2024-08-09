import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/weatherReportMode;.dart';

class WeatherService {
  final String _apiKey = 'your_weather_api_key'; // Replace with your actual API key

  Future<List<WeatherReport>> fetchWeatherReports(List<Map<String, String>> locations) async {
    List<WeatherReport> weatherReports = [];

    for (var location in locations) {
      final response = await http.get(Uri.parse(
          'https://api.weatherapi.com/v1/current.json?key=$_apiKey&q=${location['city']},${location['state']},${location['country']}'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        weatherReports.add(WeatherReport(
          location: '${location['city']}, ${location['state']}, ${location['country']}',
          temperature: data['current']['temp_c'],
          condition: data['current']['condition']['text'],
        ));
      } else {
        throw Exception('Failed to load weather data');
      }
    }

    return weatherReports;
  }
}
