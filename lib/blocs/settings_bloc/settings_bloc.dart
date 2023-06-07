import 'package:equatable/equatable.dart';

import '../bloc_exports.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsInitial(isDarkModeEnabled: false)) {
    void onDarkModeEnabled(DarkModeEnabled event, Emitter<SettingsState> emit) {
      emit(const SettingsState(isDarkModeEnabled: true));
    }

    void onDarkModeDisabled(
        DarkModeDisabled event, Emitter<SettingsState> emit) {
      emit(const SettingsState());
    }

    on<DarkModeEnabled>(onDarkModeEnabled);

    on<DarkModeDisabled>(onDarkModeDisabled);
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toMap();
  }
}
