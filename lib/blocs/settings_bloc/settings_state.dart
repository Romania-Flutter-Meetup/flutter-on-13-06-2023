// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({this.isDarkModeEnabled = false});
  final bool isDarkModeEnabled;

  @override
  List<Object> get props => <Object>[isDarkModeEnabled];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isDarkModeEnabled': isDarkModeEnabled,
    };
  }

  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      isDarkModeEnabled: map['isDarkModeEnabled'] as bool,
    );
  }
}

class SettingsInitial extends SettingsState {
  const SettingsInitial({required super.isDarkModeEnabled});
}
