import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/model/homeModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:jpmcompanion/variableConst.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import '../const.dart';

class ShortcutMenuViewModel extends BaseViewModel {
  // SETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<FlSpot> _pendapatanSpots = [
    FlSpot(0, 0),
  ];

  List<FlSpot> _deliveryOrderSpots = [
    FlSpot(0, 0),
  ];

  DataDashboard _dataDashboard;
  List<String> _spotsName = [];
  User _user;
  int _urutan;
  List<Map> _menu = [];
  // GETTER
  List<FlSpot> get pendapatanSpots => _pendapatanSpots;
  List<FlSpot> get deliveryOrderSpots => _deliveryOrderSpots;
  DataDashboard get dataDashboard => _dataDashboard;
  List<String> get spotsName => _spotsName;
  List<Map> get menu => _menu;
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  init(context, urutan) async {
    await redirectToLogin(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('user');
    if (temp != null) {
      _user = User.fromJson(jsonDecode(temp));
    }
    _urutan = urutan;
    await getMenuShortcut(context);
    notifyListeners();
  }

  getMenuShortcut(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var tempMenu in menuShortcut) {
      print(tempMenu);
      for (HakAkses item in _user.hakAkses) {
        if (tempMenu['route'] == item.masterMenu.url) {
          switch (item.masterMenu.url) {
            case createDoRoute:
              if (item.view == 'true') {
                _menu.add(tempMenu);
              }
              break;
            case trackingDoRoute:
              if (item.view == 'true') {
                _menu.add(tempMenu);
              }
              break;
            case updateDoRoute:
              if (item.view == 'true') {
                _menu.add(tempMenu);
              }
              break;
            case purchaseOrderRoute:
              if (item.view == 'true') {
                _menu.add(tempMenu);
              }
              break;
            case listDoRoute:
              if (item.view == 'true') {
                _menu.add(tempMenu);
              }
              break;
            default:
          }
        }
      }
    }

    if (prefs.getString('shortcut$_urutan') != null) {
      _menu.add(deleteMenu);
    }

    notifyListeners();
  }

  setShortcut(context, item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('shortcut$_urutan', jsonEncode(item));
    Navigator.of(context).pop();
    notifyListeners();
  }

  delete(context, item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('shortcut$_urutan');
    Navigator.of(context).pop();
    notifyListeners();
  }
}
