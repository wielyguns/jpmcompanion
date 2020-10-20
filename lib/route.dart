import 'package:flutter/material.dart';
import 'package:jpmcompanion/routeTransition.dart';
import 'package:jpmcompanion/view/dashboardView.dart';
import 'package:jpmcompanion/view/loginView.dart';

import 'const.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboardRoute:
        return RouteAnimationDurationTween(
          widget: DashboardView(),
        );
      case loginRoute:
        return RouteAnimationDurationTween(
          widget: LoginView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
