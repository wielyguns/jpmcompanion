import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../const.dart';

class HomeViewModel extends BaseViewModel {
  // SETTER
  TabController _tabController;
  TextEditingController _search = TextEditingController();
  List<FlSpot> _pendapatanSpots = [
    FlSpot(0, 0),
    FlSpot(1, 2567895670),
    FlSpot(2, 3756970345),
  ];

  List<FlSpot> _deliveryOrderSpots = [
    FlSpot(0, 0),
    FlSpot(1, 120000.0),
    FlSpot(2, 60444),
  ];

  // GETTER
  TextEditingController get search => _search;
  TabController get tabController => _tabController;
  List<FlSpot> get pendapatanSpots => _pendapatanSpots;
  List<FlSpot> get deliveryOrderSpots => _deliveryOrderSpots;
  // FUNCTION
  init(context, vsync) async {
    setBusy(true);
    _tabController = TabController(length: 4, vsync: vsync);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') == null) {
      return Navigator.popAndPushNamed(context, loginRoute);
    }
    setBusy(false);
    notifyListeners();
  }

  logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('id');
    Navigator.popAndPushNamed(context, loginRoute);
  }

  changeTab(index) {
    print(index);
    _tabController.animateTo(index);
    notifyListeners();
  }
}
