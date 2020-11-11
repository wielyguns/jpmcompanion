import 'package:flutter/material.dart';
import 'package:jpmcompanion/routeTransition.dart';
import 'package:jpmcompanion/view/shippingOrderDetailView.dart';
import 'package:jpmcompanion/view/shippingOrderView.dart';
import 'package:stacked/stacked.dart';

class MapTabViewModel extends BaseViewModel {
  // SETTER
  GlobalKey<ScaffoldState> _locationMapKey = GlobalKey<ScaffoldState>();

  // GETTER
  GlobalKey<ScaffoldState> get locationMapKey => _locationMapKey;

  init(context) async {}

  addPurchaseOrder(context, result) {
    Navigator.pushAndRemoveUntil(
      context,
      RouteAnimationDurationTween(
        widget: ShippingOrderView(
          result: result,
        ),
      ),
      (route) => false,
    );
  }

  shippingOrderList(context, result) {
    Navigator.pushAndRemoveUntil(
      context,
      RouteAnimationDurationTween(
        widget: ShippingOrderDetailView(
          param: result,
        ),
      ),
      (route) => false,
    );
    // Navigator.of(context).pushNamed(
    //   shippingOrderDetailRoute,
    //   arguments: result,
    // );
  }
}
