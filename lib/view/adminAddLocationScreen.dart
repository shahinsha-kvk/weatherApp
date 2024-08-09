import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/locationService.dart';

class AddLocationScreen extends StatelessWidget {
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final LocationService _locationService = LocationService();

  void addLocation() async {
    final country = countryController.text;
    final state = stateController.text;
    final district = districtController.text;
    final city = cityController.text;

    await _locationService.addLocation(country, state, district, city);
    Get.snackbar('Success', 'Location added successfully');
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: countryController,
              decoration: InputDecoration(labelText: 'Country'),
            ),
            TextField(
              controller: stateController,
              decoration: InputDecoration(labelText: 'State'),
            ),
            TextField(
              controller: districtController,
              decoration: InputDecoration(labelText: 'District'),
            ),
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addLocation,
              child: Text('Add Location'),
            ),
          ],
        ),
      ),
    );
  }
}
