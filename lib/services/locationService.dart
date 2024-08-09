import 'package:cloud_firestore/cloud_firestore.dart';

class LocationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addLocation(String country, String state, String district, String city) async {
    try {
      // Create a document for the country
      DocumentReference countryRef = _firestore.collection('locations').doc(country);
      await countryRef.set({'name': country});

      // Create a subcollection for states under the country document
      DocumentReference stateRef = countryRef.collection('states').doc(state);
      await stateRef.set({'name': state});

      // Create a subcollection for districts under the state document
      DocumentReference districtRef = stateRef.collection('districts').doc(district);
      await districtRef.set({'name': district});

      // Create a subcollection for cities under the district document
      DocumentReference cityRef = districtRef.collection('cities').doc(city);
      await cityRef.set({'name': city});

      print('Location added successfully');
    } catch (e) {
      print('Error adding location: $e');
    }
  }
}
