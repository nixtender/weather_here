import 'package:flutter/material.dart';
import 'package:weather_here/const/app_routes.dart' as routes;
import 'package:weather_here/ui/pages/splash.dart';

import '../pages/auth.dart';
import '../pages/weather.dart';

class AppNavigator {
  static final key = GlobalKey<NavigatorState>();

  static void toAuth() {
    key.currentState?.pushNamedAndRemoveUntil(routes.auth, ((route) => false));
  }

  static void toWeather() {
    key.currentState
        ?.pushNamedAndRemoveUntil(routes.weather, ((route) => false));
  }

  static Route<dynamic>? onGeneratedRoutes(RouteSettings settings, context) {
    if (settings.name == routes.splash) {
      return PageRouteBuilder(pageBuilder: (_, __, ___) => Splash());
    }

    if (settings.name == routes.auth) {
      return PageRouteBuilder(pageBuilder: (_, __, ___) => Authentication());
    }

    if (settings.name == routes.weather) {
      return PageRouteBuilder(pageBuilder: (_, __, ___) => Weather.create());
    }
  }
}
