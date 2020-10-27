import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
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

    await getAllNopolActive();
    setBusy(false);
    notifyListeners();
  }

  getAllNopolActive() async {
    _trackingPosition = TrackingPosition(
      listNopol: [],
      statusVehicle: 2,
    );
    var result = await MainService().getNopolActive(_trackingPosition);
    print(_trackingPosition.toJson());
  }

  logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('id');
    Navigator.popAndPushNamed(context, loginRoute);
  }

  changeTab(index) {
    _index = index;
    print(index);
    _tabController.animateTo(index);
    notifyListeners();
  }

  drawer(context) {
    ScreenUtil.init(context);
    switch (_index) {
      case 1:
        return Drawer(
          child: Container(
            margin: EdgeInsets.only(top: 0.04.hp, left: 0.02.wp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    'List Kendaraan Aktif',
                    style: TextStyle(
                      color: Color(
                        hexStringToHexInt('#FF5373'),
                      ),
                      fontSize: 60.ssp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (var i = 0; i < 20; i++) Text('$i'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
        break;
      default:
        return Drawer(
          child: Text('hello'),
        );
    }
  }
}
