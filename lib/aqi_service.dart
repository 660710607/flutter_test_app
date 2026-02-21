import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapp/aqi_model.dart';

class ApiService {
  static Future<AQIModel> fetchAQI() async {
    final response = await http.get(
      Uri.parse(
        'https://api.waqi.info/feed/bangkok/?token=311146da71db074fd97cc100f8949835af6b49cc',
      ),
    );

    if (response.statusCode == 200) {
      return AQIModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load AQI');
    }
  }
}
