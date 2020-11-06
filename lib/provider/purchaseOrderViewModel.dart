import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';
import 'package:stacked/stacked.dart';

class PurchaseOrderViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<DropdownMenuItem> _asalDropdownMenuItem = [];
  String _titleSnap;
  // SETTER
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  List<DropdownMenuItem> get asalDropdownMenuItem => _asalDropdownMenuItem;

  String get titleSnap => _titleSnap;
  // FUNCTION
  init(context) async {}

  getKotaAsal(context) async {
    var result = await Navigator.of(context).pushNamed(listKotaRoute);
    print(result);
    notifyListeners();
  }
}
