import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_application/data/pathes.dart';
import 'package:weather_application/models/weather_object.dart';

abstract class WeatherAPIHandler {
  static Future<WeatherForecast> getForecast({required String cityName}) async {
    var url = Uri.parse(Pathes.DOMAIN +
        Pathes.WEATHER_FORECAST +
        'q=$cityName&lang=ru&units=metric&appid=' +
        Pathes.API_KEY);

    var response = await http.get(url);
    print('${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Something wrong');
    }
  }

  static Future<WeatherForecast> getForecastByLocation(
      {required Position pos}) async {
    var url = Uri.parse(Pathes.DOMAIN +
        Pathes.WEATHER_FORECAST +
        'lat=${pos.latitude}&lon=${pos.longitude}&lang=ru&units=metric&appid=' +
        Pathes.API_KEY);

    var response = await http.get(url);
    print('${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Something wrong');
    }
  }
}
