import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umbrella/core/utils/helper_functions.dart';
import 'package:umbrella/data/models/weather.dart';
import 'package:umbrella/data/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(WeatherInital()) {
    on<WeatherFetchedByLocation>(_weatherFetchedByLocationHandler);
    on<WeatherFetchedByCityName>(_weatherFetchedByCityNameHandler);
  }

  void _weatherFetchedByLocationHandler(WeatherFetchedByLocation event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherLoading());

      final weather = await weatherRepository.getWeatherDataByLocation();

      emit(WeatherFetched(weather: weather));
    } on DioException catch (e) {
      emit(WeatherError(errorMessage: getDioErrorMessage(e)));
    } catch (e) {
      emit(WeatherError(errorMessage: e.toString()));
    }
  }

  void _weatherFetchedByCityNameHandler(WeatherFetchedByCityName event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherLoading());

      final weather = await weatherRepository.getWeatherDataByCityName(cityName: event.cityName);

      emit(WeatherFetched(weather: weather));
    } on DioException catch (e) {
      emit(WeatherError(errorMessage: getDioErrorMessage(e)));
    } catch (e) {
      emit(WeatherError(errorMessage: e.toString()));
    }
  }
}
