part of "weather_bloc.dart";

sealed class WeatherEvent {}

class WeatherFetchedByCityName extends WeatherEvent {
  final String cityName;

  WeatherFetchedByCityName({required this.cityName});
}

class WeatherFetchedByLocation extends WeatherEvent {}
