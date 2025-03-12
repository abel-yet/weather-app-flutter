import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:umbrella/core/environment.dart';

class Weatherapi {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getWeatherDataByCityName({required String cityName}) async {
    final url = "${Environment.apiUrl}/forecast.json?key=${Environment.apiKey}&days=3&q=$cityName";

    final result = await _dio.get(url);

    return result.data;
  }

  Future<Map<String, dynamic>> getWeatherDataByLocation({required Position position}) async {
    final location = "${position.latitude},${position.longitude}";

    final url = "${Environment.apiUrl}/forecast.json?key=${Environment.apiKey}&days=3&q=$location";

    final result = await _dio.get(url);

    return result.data;
  }
}
