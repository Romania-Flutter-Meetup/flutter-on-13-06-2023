part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => <Object>[];
}

class DarkModeEnabled extends SettingsEvent {}

class DarkModeDisabled extends SettingsEvent {}
