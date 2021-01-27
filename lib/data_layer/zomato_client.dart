import 'package:bloc_flutter/data_layer/location_model.dart';
import 'package:bloc_flutter/data_layer/restaurant_model.dart';
import 'dart:async';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class ZomatoClient {
  static const String API_KEY = "0a5ce914f969110918068951b67198fd";
  static const String HOST = "developers.zomato.com";
  static const String CONTEXT_ROOT = "api/v2.1";

  Future<List<Location>> fetchLocations(String query) async {
    final results = await request(
        path: 'locations', parameters: {'query': query, 'count': '10'});
    return results['location_suggestions']
        .map<Location>((json) => Location.fromJson(json))
        .toList(growable: false);
  }

  Future<List<Restaurant>> fetchRestaurants(
      Location location, String query) async {
    final results = await request(path: 'search', parameters: {
      'entity_id': location.id.toString(),
      'entity_type': location.type,
      'q': query,
      'count': '10'
    });
    return results['restaurants']
        .map<Restaurant>((json) => Restaurant.fromJson(json['restaurant']))
        .toList(growable: false);
  }

  Future<Map> request(
      {@required String path, Map<String, String> parameters}) async {
    final results = await http.get(
        Uri.https(HOST, "$CONTEXT_ROOT/$path", parameters),
        headers: {'Accept': 'application/json', 'user-key': API_KEY});
    return json.decode(results.body);
  }
}
