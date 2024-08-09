import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:weathertask/view/weatherReportScreen.dart';
import 'package:weathertask/model/weatherReportMode;.dart';
import '../services/excelService.dart';
import '../services/weatherService.dart';

class UploadExcelScreen extends StatelessWidget {
  final ExcelService _excelService = ExcelService();
  final WeatherService _weatherService = WeatherService();

  void uploadFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final file = result.files.single;
      final locations = await _excelService.parseExcel(file.path);

      // Fetch weather reports
      final weatherReports = await _weatherService.fetchWeatherReports(locations);

      // Navigate to WeatherReportScreen with the fetched reports
      Get.to(() => WeatherReportScreen(weatherReports: weatherReports));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Excel File'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: uploadFile,
          child: const Text('Upload File'),
        ),
      ),
    );
  }
}
