import 'package:umbrella/data/data_providers/location_service.dart';
import 'package:umbrella/data/data_providers/weatherapi.dart';
import 'package:umbrella/data/models/weather.dart';

class WeatherRepository {
  final LocationService locationService;
  final Weatherapi weatherapi;

  WeatherRepository({required this.locationService, required this.weatherapi});


  Future<Weather> getWeatherDataByCityName({required String cityName}) async {
    final rawData = await weatherapi.getWeatherDataByCityName(cityName: cityName);

    final weather = Weather.fromMap(rawData);

    return weather;
  }

  Future<Weather> getWeatherDataByLocation() async {
    final position = await locationService.getCurrentLocation();

    final rawData = await weatherapi.getWeatherDataByLocation(position: position);

    final weather = Weather.fromMap(rawData);

    return weather;
  }

}