import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:impact/models/specie.dart';

class ApiService {
  Future<Position> _determinePosition() async {
    try {
      var status = await Permission.location.request();
      if (status != PermissionStatus.granted) {
        throw Exception('Location permission denied');
      }

      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      print('Error determining position: $e');
      rethrow;
    }
  }

  Future<void> getSpeciesInArea(
      double minLat, double maxLat, double minLon, double maxLon) async {
    try {
      final apiUrl =
          "https://api.gbif.org/v1/occurrence/search?decimalLatitude=$minLat,$maxLat&decimalLongitude=$minLon,$maxLon&limit=100";
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> result = jsonDecode(response.body)['results'];
        for (var specie in result) {
          final log = Specie.fromJson(specie);
          print(log.kingdom);
        }
        return;
      } else {
        print('Failed to fetch species data: ${response.statusCode}');
        throw Exception('Failed to fetch species data');
      }
    } catch (e) {
      print('Error fetching species data: $e');
      rethrow;
    }
  }

  Future<void> executeApiService() async {
    try {
      // final position = await _determinePosition();
      await getSpeciesInArea(55.96, 55.97, 12.20, 12.25);
    } catch (e) {
      print('Error executing API service: $e');
      rethrow;
    }
  }
}
