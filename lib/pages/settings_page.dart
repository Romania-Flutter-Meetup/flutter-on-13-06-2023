import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';

import '../../common/page_title.dart';
import '../blocs/bloc_exports.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            const PageTitle(title: 'Settings'),
            SizedBox(
              height: context.height * 0.02,
            ),
            _buildThemeSelector(
                context, 'Change Theme', Icons.light_mode_rounded)
          ],
        ));
  }

  Widget _buildThemeSelector(
      BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (BuildContext context, SettingsState state) {
          return DayNightSwitcher(
            isDarkModeEnabled: state.isDarkModeEnabled,
            onStateChanged: (bool value) {
              value
                  ? context.read<SettingsBloc>().add(DarkModeEnabled())
                  : context.read<SettingsBloc>().add(DarkModeDisabled());
            },
          );
        },
      ),
    );
  }
}
