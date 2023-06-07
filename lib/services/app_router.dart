import 'package:flutter/material.dart';
import '../pages/add_edit_todo.dart';
import '../pages/landing_page.dart';
import '../pages/settings_page.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LandingPage.routeName:
        return getRoute(const LandingPage());
      case SettingsPage.routeName:
        return getRoute(const SettingsPage());
      case AddOrEditTodo.routeName:
        return getRoute(const AddOrEditTodo());
      default:
        return null;
    }
  }

  MaterialPageRoute<dynamic> getRoute(Widget page) {
    return MaterialPageRoute<dynamic>(builder: (_) => page);
  }
}
