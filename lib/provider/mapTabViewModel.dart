import 'package:flutter/material.dart';
import 'package:jpmcompanion/routeTransition.dart';
import 'package:jpmcompanion/view/purchaseOrderView.dart';
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
        widget: PurchaseOrderView(
          result: result,
        ),
      ),
      (route) => false,
    );
  }
}
