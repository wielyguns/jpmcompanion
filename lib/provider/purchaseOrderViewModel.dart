import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PurchaseOrderViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  // SETTER
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
}
