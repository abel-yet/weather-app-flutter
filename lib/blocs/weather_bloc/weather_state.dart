part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherInital extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherFetched extends WeatherState {
  final Weather weather;

  WeatherFetched({required this.weather});

  @override
  List<Object?> get props => [weather];
}

class WeatherError extends WeatherState {
  final String errorMessage;

  WeatherError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}