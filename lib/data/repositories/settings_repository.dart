import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  final SharedPreferences pref;

  static const String defaultLocationKey = "Default Location";
  static const String tempKey = "Temp";
  static const String windSpeedKey = "Wind Speed";
  static const String precipitationKey = "Precipitation";
  static const String visibilityKey = "Visibility";

  SettingsRepository({required this.pref});

  String? getDefaultLocation() {
    return pref.getString(defaultLocationKey);
  }

  Future<bool> setDefaultLocation(String value) async {
    return await pref.setString(defaultLocationKey, value);
  }

  String? getTempUnit() {
    return pref.getString(tempKey);
  }

  Future<bool> setTempUnit(String value) async {
    return await pref.setString(tempKey, value);
  }

  String? getPrecipitationUnit() {
    return pref.getString(precipitationKey);
  }

  Future<bool> setPrecipitationUnit(String value) async {
    return await pref.setString(precipitationKey, value);
  }

  String? getWSUnit() {
    return pref.getString(windSpeedKey);
  }

  Future<bool> setWSUnit(String value) async {
    return await pref.setString(windSpeedKey, value);
  }

  String? getVisibilityUnit() {
    return pref.getString(visibilityKey);
  }

  Future<bool> setVisibilityUnit(String value) async {
    return await pref.setString(visibilityKey, value);
  }
}
