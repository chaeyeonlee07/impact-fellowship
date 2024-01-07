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

  static Future<List<Specie>> getSpeciesInArea(
      double minLat, double maxLat, double minLon, double maxLon) async {
    List<Specie> specieInstances = [];
    try {
      final apiUrl =
          "https://api.gbif.org/v1/occurrence/search?decimalLatitude=$minLat,$maxLat&decimalLongitude=$minLon,$maxLon&limit=10";
      final response = await http.get(Uri.parse(apiUrl));
      print(response.statusCode);
      if (response.statusCode == 200) {
        final List<dynamic> result = jsonDecode(response.body)['results'];
         
        for (var specie in result) {
          final log = Specie.fromJson(specie);
          specieInstances.add(log);
        }
        return specieInstances;
      } else {
        print('Failed to fetch species data: ${response.statusCode}');
        throw Exception('Failed to fetch species data');
      }
    } catch (e) {
      print('Error fetching species data: $e');
      rethrow;
    }
  }
}
