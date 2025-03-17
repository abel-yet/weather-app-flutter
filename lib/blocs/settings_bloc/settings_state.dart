part of 'settings_bloc.dart';

class SettingsState extends Equatable {

  final String tempUnit;
  final String windSpeedUnit;
  final String precipitationUnit;
  final String visibilityUnit;
  final String? defaultLocation;

  static SettingsState initial = SettingsState(tempUnit: "Celsius", windSpeedUnit: "km/h", precipitationUnit: 'mm', visibilityUnit: "km", defaultLocation: null);

  const SettingsState({
    required this.tempUnit,
    required this.windSpeedUnit,
    required this.precipitationUnit,
    required this.visibilityUnit,
    required this.defaultLocation
  });
  
  @override
  List<Object?> get props => [tempUnit, windSpeedUnit, precipitationUnit, visibilityUnit, defaultLocation];

  

  SettingsState copyWith({
    String? tempUnit,
    String? windSpeedUnit,
    String? precipitationUnit,
    String? visibilityUnit,
    String? defaultLocation,
  }) {
    return SettingsState(
      tempUnit: tempUnit ?? this.tempUnit,
      windSpeedUnit: windSpeedUnit ?? this.windSpeedUnit,
      precipitationUnit: precipitationUnit ?? this.precipitationUnit,
      visibilityUnit: visibilityUnit ?? this.visibilityUnit,
      defaultLocation: defaultLocation ?? this.defaultLocation,
    );
  }
}

