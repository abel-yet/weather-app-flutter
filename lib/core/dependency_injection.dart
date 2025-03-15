import 'package:get_it/get_it.dart';
import 'package:umbrella/blocs/search_history/search_history_bloc.dart';
import 'package:umbrella/blocs/weather_bloc/weather_bloc.dart';
import 'package:umbrella/data/data_providers/database_helper.dart';
import 'package:umbrella/data/data_providers/location_service.dart';
import 'package:umbrella/data/data_providers/weatherapi.dart';
import 'package:umbrella/data/repositories/search_history_repository.dart';
import 'package:umbrella/data/repositories/weather_repository.dart';

final sl = GetIt.instance;

void setupSL() {
  // BLocs

  sl.registerLazySingleton<WeatherBloc>(() => WeatherBloc(weatherRepository: sl<WeatherRepository>()));

  sl.registerLazySingleton<SearchHistoryBloc>(() => SearchHistoryBloc(searchHistoryRepository: sl<SearchHistoryRepository>()));

  // Repositories

  sl.registerLazySingleton<WeatherRepository>(() => WeatherRepository(locationService: sl<LocationService>(), weatherapi: sl<Weatherapi>()));

  sl.registerLazySingleton<SearchHistoryRepository>(() => SearchHistoryRepository(databaseHelper: sl<DatabaseHelper>()));


  // Data Providers

  sl.registerLazySingleton<Weatherapi>(() => Weatherapi());

  sl.registerLazySingleton<LocationService>(() => LocationService());

  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper.instance);
}
