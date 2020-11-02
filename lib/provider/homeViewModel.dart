import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/model/trackingPositionModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:jpmcompanion/widget/mapDrawer.dart';
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
  int _index = 0;
  TrackingPosition _trackingPosition = TrackingPosition();
  List<TrackingResult> _trackingResult = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TrackingResult _activeTracking = TrackingResult();
  // GETTER
  TextEditingController get search => _search;
  TabController get tabController => _tabController;
  TrackingResult get activeTracking => _activeTracking;
  List<FlSpot> get pendapatanSpots => _pendapatanSpots;
  List<FlSpot> get deliveryOrderSpots => _deliveryOrderSpots;
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  // FUNCTION
  init(context, vsync) async {
    setBusy(true);
    _tabController = TabController(length: 4, vsync: vsync);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') == null) {
      return Navigator.popAndPushNamed(context, loginRoute);
    }

    await getAllNopolActive();
    setBusy(false);
    notifyListeners();
  }

  getAllNopolActive() async {
    _trackingResult = [];
    var result = await MainService().getNopolActive(_trackingPosition);

    for (var item in result['Data']) {
      if (result['ResponseCode'] == 1) {
        item = jsonEncode(item);
        _trackingResult.add(TrackingResult.fromJson(jsonDecode(item)));
      }
    }
    notifyListeners();
  }

  logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('id');
    Navigator.popAndPushNamed(context, loginRoute);
  }

  changeTab(index) {
    _index = index;
    _tabController.animateTo(index);
    notifyListeners();
  }

  drawer(context) {
    ScreenUtil.init(context);
    switch (_index) {
      case 1:
        return MapDrawer(
          result: _trackingResult,
          onTap: (e) async {
            _scaffoldKey.currentState.openEndDrawer();
            _activeTracking = e;
            notifyListeners();
          },
          onRefresh: () async {
            await getAllNopolActive();
            notifyListeners();
          },
        );
        break;
      default:
        return Drawer(
          child: Text('hello'),
        );
    }
  }
}
