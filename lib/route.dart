import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart';
import 'package:jpmcompanion/routeTransition.dart';
import 'package:jpmcompanion/view/createDoView.dart';
import 'package:jpmcompanion/view/doDetailView.dart';
import 'package:jpmcompanion/view/homeView.dart';
import 'package:jpmcompanion/view/listCustomerView.dart';
import 'package:jpmcompanion/view/listDoView.dart';
import 'package:jpmcompanion/view/listKotaView.dart';
import 'package:jpmcompanion/view/listNopolView.dart';
import 'package:jpmcompanion/view/loginView.dart';
import 'package:jpmcompanion/view/mapSelectView.dart';
import 'package:jpmcompanion/view/shippingOrderDetailView.dart';
import 'package:jpmcompanion/view/shippingOrderView.dart';
import 'package:jpmcompanion/view/trackingDoView.dart';
import 'package:jpmcompanion/view/updateDoScannerView.dart';
import 'package:jpmcompanion/view/updateDoView.dart';
import 'package:jpmcompanion/widget/camera.dart';

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
          widget: ShippingOrderView(),
        );
      case listKotaRoute:
        return RouteAnimationDurationTween(
          widget: ListKotaView(),
        );
      case listCustomerRoute:
        return RouteAnimationDurationTween(
          widget: ListCustomerView(),
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
      case shippingOrderDetailRoute:
        ShippingOrderData data = settings.arguments;
        return RouteAnimationDurationTween(
          widget: ShippingOrderDetailView(
            param: data,
          ),
        );
      case updateDoRoute:
        // ignore: unused_local_variable
        ShippingOrderData data = settings.arguments;
        return RouteAnimationDurationTween(
          widget: UpdateDoView(),
        );
      case updateDoScannerRoute:
        var data = settings.arguments;
        return RouteAnimationDurationTween(
          widget: UpdateDoScannerView(
            param: data,
          ),
        );
      case trackingDoRoute:
        var data = settings.arguments;
        return RouteAnimationDurationTween(
          widget: TrackingDoView(
            param: data,
          ),
        );
      case listDoRoute:
        var data = settings.arguments;
        return RouteAnimationDurationTween(
          widget: ListDoView(param: data),
        );
      case doDetailRoute:
        var data = settings.arguments;
        return RouteAnimationDurationTween(
          widget: DoDetailView(param: data),
        );
      case createDoRoute:
        return RouteAnimationDurationTween(
          widget: CreateDoView(),
        );
      case camera:
        return RouteAnimationDurationTween(
          widget: CameraApp(),
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
