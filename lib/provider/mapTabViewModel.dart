import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';
import 'package:stacked/stacked.dart';

class MapTabViewModel extends BaseViewModel {
  // SETTER
  GlobalKey<ScaffoldState> _locationMapKey = GlobalKey<ScaffoldState>();

  // GETTER
  GlobalKey<ScaffoldState> get locationMapKey => _locationMapKey;

  init(context) async {}

  addPurchaseOrder(context) async {
    var result = await Navigator.of(context).pushNamed(purchaseOrderRoute);
  }
}
