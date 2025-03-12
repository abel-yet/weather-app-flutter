import 'package:get_it/get_it.dart';
import 'package:umbrella/blocs/weather_bloc/weather_bloc.dart';
import 'package:umbrella/data/data_providers/location_service.dart';
import 'package:umbrella/data/data_providers/weatherapi.dart';
import 'package:umbrella/data/repositories/weather_repository.dart';

final sl = GetIt.instance;

void setupSL() {
  // BLocs

  sl.registerLazySingleton<WeatherBloc>(() => WeatherBloc(weatherRepository: sl<WeatherRepository>()));

  // Repositories

  sl.registerLazySingleton<WeatherRepository>(() => WeatherRepository(locationService: sl<LocationService>(), weatherapi: sl<Weatherapi>()));


  // Data Providers

  sl.registerLazySingleton<Weatherapi>(() => Weatherapi());

  sl. registerLazySingleton<LocationService>(() => LocationService());
}
