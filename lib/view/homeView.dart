import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/provider/homeViewModel.dart';
import 'package:jpmcompanion/view/dashboardTabView.dart';
import 'package:jpmcompanion/view/mapTabView.dart';
import 'package:jpmcompanion/widget/customBottomNavigationBar.dart';
import 'package:stacked/stacked.dart';
import 'package:vibration/vibration.dart';

import '../const.dart';

import '../widget/loadingScreen.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String token = '';
  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    Vibration();
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }
  }

  @override
  void initState() {
    _firebaseMessaging.subscribeToTopic('001');
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
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.init(context, this),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: LoadingScreen(
          showLoadingApi: false,
          showLoadingScreen: model.isBusy,
          child: Scaffold(
            key: model.scaffoldKey,
            drawer: model.drawer(context),
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
              actions: [
                Container(
                  width: 0.1.wp,
                  height: 0.1.wp,
                  margin: EdgeInsets.only(right: 0.03.wp),
                  alignment: Alignment.center,
                  child: MaterialButton(
                    splashColor: purpleLightTheme,
                    onPressed: () {},
                    elevation: 0,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Icon(
                          Icons.notifications_active,
                          color: textGrey,
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Icon(
                            FontAwesomeIcons.solidCircle,
                            color: Colors.red,
                            size: 25.ssp,
                          ),
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(0),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
            body: DoubleBackToCloseApp(
              snackBar: const SnackBar(
                content: Text('Tap lagi untuk keluar'),
              ),
              child: Container(
                width: double.infinity,
                height: 1.hp,
                color: Colors.white,
                child: (model.tabController != null)
                    ? TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: model.tabController,
                        children: [
                          Container(
                            child: DashboardTabView(),
                          ),
                          Container(
                            child: MapTabView(
                              result: model.activeTracking,
                              onSnapOpen: (value) => model.hideTab(value),
                            ),
                          ),
                          Container(
                            child: Image(
                              width: 0.3.wp,
                              image: AssetImage('assets/Asset 2@4x.png'),
                            ),
                          ),
                          Container(
                            child: Image(
                              width: 0.3.wp,
                              image: AssetImage('assets/Asset 2@4x.png'),
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              height: kToolbarHeight,
              onTap: (index) {
                model.changeTab(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
