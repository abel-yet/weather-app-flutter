part of 'settings_bloc.dart';

sealed class SettingsEvent {}

class SettingsFetched extends SettingsEvent {}

class SetDefaultLocation extends SettingsEvent {
  final String defaultLocation;

  SetDefaultLocation({required this.defaultLocation});
}

class SetTempUnit extends SettingsEvent {
  final String tempUnit;

  SetTempUnit({required this.tempUnit});
}

class SetPrecipitationUnit extends SettingsEvent {
  final String precipitationUnit;

  SetPrecipitationUnit({required this.precipitationUnit});
}

class SetWindSpeedUnit extends SettingsEvent {
  final String windSpeedUnit;

  SetWindSpeedUnit({required this.windSpeedUnit});
}

class SetVisibilityUnit extends SettingsEvent {
  final String visibilityUnit;

  SetVisibilityUnit({required this.visibilityUnit});
}

