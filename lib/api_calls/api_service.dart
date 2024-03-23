import 'dart:convert';

import 'package:restaurant_app_ipix/constants/global_variables.dart';
import 'package:restaurant_app_ipix/model/restaurant_model.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Future<List<Restaurants>> fetchRestaurants() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['restaurants'];
        return data.map((json) => Restaurants.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load restaurants');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
