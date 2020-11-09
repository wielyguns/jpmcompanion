import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jpmcompanion/routeTransition.dart';
import 'package:jpmcompanion/view/homeView.dart';
import 'package:jpmcompanion/view/listKotaView.dart';
import 'package:jpmcompanion/view/listNopolView.dart';
import 'package:jpmcompanion/view/loginView.dart';
import 'package:jpmcompanion/view/mapSelectView.dart';
import 'package:jpmcompanion/view/purchaseOrderView.dart';

import 'const.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboardRoute:
        return RouteAnimationDurationTween(
          widget: HomeView(),
        );
      case loginRoute:
        return RouteAnimationDurationTween(
          widget: LoginView(),
        );
      case purchaseOrderRoute:
        return RouteAnimationDurationTween(
          widget: PurchaseOrderView(),
        );
      case listKotaRoute:
        return RouteAnimationDurationTween(
          widget: ListKotaView(),
        );
      case listNopolRoute:
        return RouteAnimationDurationTween(
          widget: ListNopolView(),
        );
      case mapSelectRoute:
        Position position = settings.arguments;
        return RouteAnimationDurationTween(
          widget: MapSelectView(
            position: position,
          ),
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
