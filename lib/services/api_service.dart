import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class Species {
  final String name;
  final String imageUrl;

  Species({required this.name, required this.imageUrl});
}

class ApiService {
  Future<Position> _determinePosition() async {
    try {
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      print('Error determining position: $e');
      rethrow;
    }
  }

  Future<void> getSpeciesInArea(
      double minLat, double minLon, double maxLat, double maxLon) async {
    try {
      final apiUrl = _buildApiUrl(minLat, minLon, maxLat, maxLon);
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // Parse and handle the data here
        print(data);
      } else {
        print('Failed to fetch species data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching species data: $e');
      rethrow;
    }
  }

  Future<void> executeApiService() async {
    try {
      final position = await _determinePosition();
      await getSpeciesInArea(
        position.latitude - 0.02,
        position.longitude - 0.02,
        position.latitude + 0.02,
        position.longitude + 0.02,
      );
    } catch (e) {
      print('Error executing API service: $e');
      // Handle or rethrow the error based on your requirements
    }
  }

  String _buildApiUrl(
      double minLat, double minLon, double maxLat, double maxLon) {
    return 'https://api.gbif.org/v1/occurrence/search?decimalLatitude=55.96,%2055.98&decimalLongitude=12.20,12.25';
  }
}
