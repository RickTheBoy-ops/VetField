import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import '../utils/polyline.dart';

class DirectionsService {
  Future<List<LatLng>> getOptimizedRoute({
    required LatLng origin,
    required LatLng destination,
    required List<LatLng> waypoints,
  }) async {
    final key = dotenv.env['GOOGLE_MAPS_API_KEY'];
    if (key == null || key.isEmpty) {
      throw Exception('Missing GOOGLE_MAPS_API_KEY');
    }
    final wp = waypoints.map((p) => '${p.latitude},${p.longitude}').join('|');
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&waypoints=optimize:true|$wp&key=$key');
    final resp = await http.get(url);
    if (resp.statusCode != 200) {
      throw Exception('Directions API error ${resp.statusCode}');
    }
    final data = json.decode(resp.body) as Map<String, dynamic>;
    final routes = data['routes'] as List<dynamic>?;
    if (routes == null || routes.isEmpty) {
      throw Exception('No routes');
    }
    final overview = routes.first['overview_polyline']['points'] as String;
    return decodePolyline(overview);
  }
}
