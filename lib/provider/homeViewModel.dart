import 'dart:convert';
import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/apiConst.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/model/trackingPositionModel.dart';
import 'package:jpmcompanion/routeTransition.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:jpmcompanion/view/loginView.dart';
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
  User _user;
  bool _isSnapOpen = false;
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
  bool get isSnapOpen => _isSnapOpen;
  // FUNCTION
  init(context, vsync) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('user');
    _user = User.fromJson(jsonDecode(temp));
    await redirectToLogin(context);
    setBusy(true);
    _tabController = TabController(length: 4, vsync: vsync);
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
    prefs.remove('user');
    Navigator.pushAndRemoveUntil(
      context,
      RouteAnimationDurationFade(
        widget: LoginView(),
      ),
      (route) => false,
    );
  }

  changeTab(index) {
    _index = index;
    _tabController.animateTo(index);
    notifyListeners();
  }

  hideTab(value) {
    if (value == 'open') {
      _isSnapOpen = true;
    } else {
      _isSnapOpen = false;
    }
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
      case 0:
        return Drawer(
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  if (_user != null)
                    UserAccountsDrawerHeader(
                      margin: EdgeInsets.only(bottom: 0.02.hp),
                      currentAccountPicture: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage('$baseApi${_user.image}'),
                      ),
                      accountName: Text(_user.nama),
                      accountEmail: Text(_user.email),
                    ),
                  Container(
                    width: 1.wp,
                    height: 0.07.hp,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(createDoRoute);
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/Asset 47300 2.png'),
                              width: 0.1.wp,
                              height: 0.1.wp,
                            ),
                            SizedBox(
                              width: 0.05.wp,
                            ),
                            Text(
                              'Delivery Order',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 45.ssp,
                                color: textGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1.wp,
                    height: 0.07.hp,
                    child: FlatButton(
                      onPressed: () {
                        return print('tes');
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/Asset 57300 1.png'),
                              width: 0.1.wp,
                            ),
                            SizedBox(
                              width: 0.05.wp,
                            ),
                            Text(
                              'Update DO V1',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 45.ssp,
                                color: textGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1.wp,
                    height: 0.07.hp,
                    child: FlatButton(
                      onPressed: () {
                        return print('tes');
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/Asset 8@4x.png'),
                              width: 0.1.wp,
                            ),
                            SizedBox(
                              width: 0.05.wp,
                            ),
                            Text(
                              'Update DO V2',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 45.ssp,
                                color: textGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1.wp,
                    height: 0.07.hp,
                    child: FlatButton(
                      onPressed: () {
                        return print('tes');
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/magnificient.png'),
                              width: 0.1.wp,
                            ),
                            SizedBox(
                              width: 0.05.wp,
                            ),
                            Text(
                              'Tracking DO',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 45.ssp,
                                color: textGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 1.wp,
                            height: 0.07.hp,
                            child: FlatButton(
                              onPressed: () {
                                return print('tes');
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.powerOff,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 0.05.wp,
                                    ),
                                    Text(
                                      'Logout',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 45.ssp,
                                        color: textGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
