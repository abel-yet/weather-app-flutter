import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umbrella/data/repositories/settings_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository settingsRepository;

  SettingsBloc({required this.settingsRepository}) : super(SettingsState.initial) {
    on<SettingsFetched>(_settingsFetchedHandler);
    on<SetDefaultLocation>(_setDefaultLocationHandler);
    on<SetTempUnit>(_setTempUnitHandler);
    on<SetPrecipitationUnit>(_setPrecipitationHandler);
    on<SetWindSpeedUnit>(_setWindSpeedUnit);
    on<SetVisibilityUnit>(_setVisibilityUnit);
    add(SettingsFetched());
  }

  Future<void> _settingsFetchedHandler(SettingsFetched event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(
      tempUnit: settingsRepository.getTempUnit(),
      windSpeedUnit: settingsRepository.getWSUnit(),
      visibilityUnit: settingsRepository.getVisibilityUnit(),
      precipitationUnit: settingsRepository.getPrecipitationUnit(),
      defaultLocation: settingsRepository.getDefaultLocation(),
    ));
  }

  Future<void> _setDefaultLocationHandler(SetDefaultLocation event, Emitter<SettingsState> emit) async {
    if (state.defaultLocation == event.defaultLocation) return;
    await settingsRepository.setDefaultLocation(event.defaultLocation);
    add(SettingsFetched());
  }

  Future<void> _setTempUnitHandler(SetTempUnit event, Emitter<SettingsState> emit) async {
    if (state.tempUnit == event.tempUnit) return;
    await settingsRepository.setTempUnit(event.tempUnit);
    add(SettingsFetched());
  }

  Future<void> _setPrecipitationHandler(SetPrecipitationUnit event, Emitter<SettingsState> emit) async {
    if (state.precipitationUnit == event.precipitationUnit) return;
    await settingsRepository.setPrecipitationUnit(event.precipitationUnit);
    add(SettingsFetched());
  }

  Future<void> _setWindSpeedUnit(SetWindSpeedUnit event, Emitter<SettingsState> emit) async {
    if (state.windSpeedUnit == event.windSpeedUnit) return;
    await settingsRepository.setWSUnit(event.windSpeedUnit);
    add(SettingsFetched());
  }

  Future<void> _setVisibilityUnit(SetVisibilityUnit event, Emitter<SettingsState> emit) async {
    if (state.visibilityUnit == event.visibilityUnit) return;
    await settingsRepository.setVisibilityUnit(event.visibilityUnit);
    add(SettingsFetched());
  }
}
