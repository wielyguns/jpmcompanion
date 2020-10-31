import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/model/trackingPositionModel.dart';
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
  List<TrackingResult> _trackingResult = [];
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
            margin: EdgeInsets.only(
              top: 0.04.hp,
              left: 0.02.wp,
              right: 0.02.wp,
            ),
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
                SizedBox(
                  height: 0.02.hp,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: _trackingResult.map(
                        (TrackingResult e) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 0.01.hp),
                            padding: EdgeInsets.symmetric(
                              vertical: 0.01.hp,
                              horizontal: 0.02.wp,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.02.wp),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  color: borderBox,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image(
                                        width: 0.14.wp,
                                        image: AssetImage(
                                          'assets/Asset 55300 1.png',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.01.hp,
                                      ),
                                      Text(
                                        '${e.nopol}',
                                        style: TextStyle(
                                          color: Color(
                                            hexStringToHexInt('#29D130'),
                                          ),
                                          fontSize: 35.ssp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Image(
                                                width: 40.ssp,
                                                image: AssetImage(
                                                  'assets/Asset 50300 1.png',
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  right: 0.04.wp,
                                                ),
                                                child: Text(
                                                  '${e.provinsi}',
                                                  style: TextStyle(
                                                    fontFamily: 'PlexSans',
                                                    fontSize: 35.ssp,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Image(
                                                width: 40.ssp,
                                                image: AssetImage(
                                                  'assets/Asset 67300 1.png',
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  right: 0.04.wp,
                                                ),
                                                child: Text(
                                                  '${e.addr}',
                                                  softWrap: false,
                                                  overflow: TextOverflow.fade,
                                                  style: TextStyle(
                                                    fontFamily: 'PlexSans',
                                                    fontSize: 35.ssp,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Image(
                                                width: 40.ssp,
                                                image: AssetImage(
                                                  'assets/Asset 76300 1.png',
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  right: 0.04.wp,
                                                ),
                                                child: Text(
                                                  'ON',
                                                  softWrap: false,
                                                  overflow: TextOverflow.fade,
                                                  style: TextStyle(
                                                    fontFamily: 'PlexSans',
                                                    fontSize: 35.ssp,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
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
