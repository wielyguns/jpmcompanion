import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jpmcompanion/provider/homeViewModel.dart';
import 'package:jpmcompanion/view/dashboardTabView.dart';
import 'package:jpmcompanion/view/mapTabView.dart';
import 'package:jpmcompanion/view/profileTabView.dart';
import 'package:jpmcompanion/widget/customBottomNavigationBar.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:stacked/stacked.dart';
import 'package:vibration/vibration.dart';

import '../const.dart';

import '../widget/loadingScreen.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String token = '';
  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    Vibration();
    if (message.containsKey('data')) {
      // Handle data message
      // ignore: unused_local_variable
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      // ignore: unused_local_variable
      final dynamic notification = message['notification'];
    }
  }

  @override
  void initState() {
    if (!mounted) {
      return;
    }

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        Vibration();
        // _showItemDialog(message);
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        Navigator.of(context).pushNamed(message['data']['route']);
        // _navigateToItemDetail(message);
      },
    );

    _firebaseMessaging.getToken().then(
          (token) => setState(
            () {
              this.token = token;
              print(token);
            },
          ),
        );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.init(context, this, _firebaseMessaging),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: LoadingScreen(
          showLoadingApi: model.isApiBusy,
          showLoadingScreen: model.isBusy,
          child: Scaffold(
            key: model.scaffoldKey,
            drawer: (model.isBusy) ? Drawer() : model.drawer(context),
            appBar: AppBar(
              elevation: 0,
              leading: Container(
                width: 0.1.wp,
                height: 0.1.wp,
                alignment: Alignment.center,
                child: MaterialButton(
                  splashColor: purpleLightTheme,
                  onPressed: () {
                    model.scaffoldKey.currentState.openDrawer();
                  },
                  elevation: 0,
                  color: Colors.white,
                  child: Icon(
                    FontAwesomeIcons.bars,
                    color: textGrey,
                  ),
                  padding: EdgeInsets.all(0),
                  shape: CircleBorder(),
                ),
              ),
              backgroundColor: Colors.white,
            ),
            body: DoubleBackToCloseApp(
              snackBar: const SnackBar(
                content: Text('Tap lagi untuk keluar'),
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 1.hp,
                    color: Colors.white,
                    child: (model.tabController != null)
                        ? TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: model.tabController,
                            children: [
                              Container(
                                child: DashboardTabView(
                                  shortcut: model.shortcut,
                                  generateShortcut: () {
                                    model.generateShortcut(context);
                                  },
                                ),
                              ),
                              (model.user != null && mapAccess)
                                  ? Container(
                                      child: MapTabView(
                                        result: model.activeTracking,
                                        onSnapOpen: (value) =>
                                            model.hideTab(value),
                                      ),
                                    )
                                  : Container(
                                      child: Image(
                                        width: 0.3.wp,
                                        image:
                                            AssetImage('assets/Asset 2@4x.png'),
                                      ),
                                    ),
                              Container(
                                child: Image(
                                  width: 0.3.wp,
                                  image: AssetImage('assets/Asset 2@4x.png'),
                                ),
                              ),
                              Container(
                                child: ProfileTabView(
                                  onRouteChanged: (param) {
                                    model.changeRoute(context, param);
                                  },
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: ConvexAppBar(
                      items: [
                        TabItem(icon: Icons.home, title: 'Home'),
                        TabItem(icon: Icons.map, title: 'Discovery'),
                        TabItem(icon: Icons.message, title: 'Notification'),
                        TabItem(icon: Icons.people, title: 'Profile'),
                      ],
                      initialActiveIndex: 0, //optional, default as 0
                      onTap: (int i) => model.changeTab(i),
                    ),
                  ),
                  if (model.darken)
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 1.wp,
                        height: 1.hp,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 1.wp,
                      height: 1.hp,
                      child: SnappingSheet(
                        snappingSheetController: model.snappingRouteController,
                        sheetBelow: SnappingSheetContent(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.04.wp,
                              vertical: 0.02.hp,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  10,
                                ),
                                topRight: Radius.circular(
                                  10,
                                ),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 0.01.hp,
                                    ),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${model.snappingStatus == 'rute' ? "Rubah Rute" : model.snappingStatus == 'user' ? "Rubah User" : "Rubah Password"}',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 50.ssp,
                                            ),
                                          ),
                                          IconButton(
                                            color: Colors.blue[100],
                                            onPressed: () {
                                              model.collapseSnapping();
                                            },
                                            icon: Icon(
                                              FontAwesomeIcons.times,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.blue[200],
                                  ),
                                  if (model.snappingStatus == 'rute')
                                    Container(
                                      child: TextFormField(
                                        controller: model.routeText,
                                        decoration: InputDecoration(
                                          hintText: 'cth:Jambangan',
                                        ),
                                      ),
                                    ),
                                  if (model.snappingStatus == 'user')
                                    Container(
                                      child: TextFormField(
                                        controller: model.namaText,
                                        decoration: InputDecoration(
                                          hintText: 'cth:Bagus',
                                        ),
                                      ),
                                    ),
                                  if (model.snappingStatus == 'user')
                                    Container(
                                      child: TextFormField(
                                        controller: model.emailText,
                                        decoration: InputDecoration(
                                          hintText: 'cth:bagus@gjpmandiri.com',
                                        ),
                                      ),
                                    ),
                                  if (model.snappingStatus == 'user')
                                    Container(
                                      child: TextFormField(
                                        controller: model.telponText,
                                        decoration: InputDecoration(
                                          hintText: 'cth:089898989',
                                        ),
                                      ),
                                    ),
                                  if (model.snappingStatus == 'password')
                                    Container(
                                      child: TextFormField(
                                        controller: model.passwordText,
                                        decoration: InputDecoration(
                                          hintText: 'cth:12345678',
                                        ),
                                      ),
                                    ),
                                  SizedBox(
                                    height: 0.02.hp,
                                  ),
                                  RaisedButton(
                                    focusElevation: 0,
                                    hoverElevation: 0,
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.blue[50],
                                    padding: EdgeInsets.zero,
                                    color: Colors.transparent,
                                    elevation: 0,
                                    onPressed: () {
                                      return model.submitRoutePickUp(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 1.wp,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 0.015.hp,
                                        horizontal: 0.04.wp,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(
                                          hexStringToHexInt('#126afc'),
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        'SUBMIT',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          heightBehavior: SnappingSheetHeight.fit(),
                        ),
                        snapPositions: [
                          SnapPosition(
                            positionPixel: 0,
                            snappingCurve: Curves.elasticOut,
                            snappingDuration: Duration(
                              milliseconds: 300,
                            ),
                          ),
                          SnapPosition(
                            positionPixel: 0.5.hp,
                            snappingCurve: Curves.elasticOut,
                            snappingDuration: Duration(
                              milliseconds: 300,
                            ),
                          ),
                        ],
                        grabbingHeight: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
