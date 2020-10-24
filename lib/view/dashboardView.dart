import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/provider/dashboardViewModel.dart';
import 'package:jpmcompanion/widget/dashboardCard.dart';
import 'package:jpmcompanion/widget/dashboardGraphicReport.dart';
import 'package:jpmcompanion/widget/dashboardHeader.dart';
import 'package:jpmcompanion/widget/dashboardSearchBar.dart';
import 'package:stacked/stacked.dart';

import '../const.dart';

import '../widget/loadingScreen.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.init(context),
      viewModelBuilder: () => DashboardViewModel(),
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: LoadingScreen(
          showLoadingApi: false,
          showLoadingScreen: model.isBusy,
          child: Scaffold(
            drawer: Drawer(),
            appBar: AppBar(
              elevation: 0,
              leading: Container(
                width: 0.1.wp,
                height: 0.1.wp,
                alignment: Alignment.center,
                child: MaterialButton(
                  splashColor: purpleLightTheme,
                  onPressed: () {},
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
            body: Container(
              width: double.infinity,
              height: 1.hp,
              color: Colors.white,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DashboardHeader(),
                      DashboardSearchBar(),
                      Container(
                        margin: EdgeInsets.only(top: 0.04.hp, bottom: 0.02.hp),
                        padding: EdgeInsets.symmetric(horizontal: 0.04.wp),
                        child: Text(
                          'Graphic Report',
                          style: TextStyle(
                            color: Color(
                              hexStringToHexInt('#5F5F5F'),
                            ),
                            fontSize: 50.ssp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 0.04.wp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DashboardGraphicReport(
                                title: 'Pendapatan',
                                spots: model.pendapatanSpots,
                              ),
                              DashboardGraphicReport(
                                title: 'Delivery Order',
                                spots: model.deliveryOrderSpots,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0.04.hp, bottom: 0.02.hp),
                        padding: EdgeInsets.symmetric(horizontal: 0.04.wp),
                        child: Text(
                          'Dashboard',
                          style: TextStyle(
                            color: Color(
                              hexStringToHexInt('#5F5F5F'),
                            ),
                            fontSize: 50.ssp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        width: 1.wp,
                        child: NotificationListener<
                            OverscrollIndicatorNotification>(
                          onNotification:
                              (OverscrollIndicatorNotification scroll) {
                            scroll.disallowGlow();
                            return;
                          },
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: AlwaysScrollableScrollPhysics(),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 0.02.hp),
                              child: Row(
                                children: [
                                  DashboardCard(
                                    total: 27,
                                    title: 'Barang\nManifest',
                                    color: Color(
                                      hexStringToHexInt('#F57466'),
                                    ),
                                    margin: EdgeInsets.only(
                                      right: 0.04.wp,
                                      left: 0.04.wp,
                                    ),
                                  ),
                                  DashboardCard(
                                    total: 8478,
                                    title: 'Barang Sedang\nDikirim',
                                    color: Color(
                                      hexStringToHexInt('#6AD0B8'),
                                    ),
                                    margin: EdgeInsets.only(
                                      right: 0.04.wp,
                                    ),
                                  ),
                                  DashboardCard(
                                    total: 9802,
                                    title: 'Barang Sampai\nTujuan',
                                    color: Color(
                                      hexStringToHexInt('#8684F3'),
                                    ),
                                    margin: EdgeInsets.only(
                                      right: 0.04.wp,
                                    ),
                                  ),
                                  DashboardCard(
                                    total: 15,
                                    title: 'Barang\nPending',
                                    color: Color(
                                      hexStringToHexInt('#BFA5F8'),
                                    ),
                                    margin: EdgeInsets.only(
                                      right: 0.04.wp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0.02.hp, bottom: 0.02.hp),
                        padding: EdgeInsets.symmetric(horizontal: 0.04.wp),
                        child: Text(
                          'Main Menu',
                          style: TextStyle(
                            color: Color(
                              hexStringToHexInt('#5F5F5F'),
                            ),
                            fontSize: 50.ssp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.04.wp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 0.2.wp,
                              child: MaterialButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {},
                                shape: RoundedRectangleBorder(),
                                child: Container(
                                  padding: EdgeInsets.all(0.01.wp),
                                  child: Image(
                                    width: 0.1.wp,
                                    image: AssetImage('assets/Component 2.png'),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 0.2.wp,
                              child: MaterialButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {},
                                shape: RoundedRectangleBorder(),
                                child: Container(
                                  padding: EdgeInsets.all(0.01.wp),
                                  child: Image(
                                    width: 0.1.wp,
                                    image: AssetImage('assets/Component 1.png'),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 0.2.wp,
                              child: MaterialButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {},
                                shape: RoundedRectangleBorder(),
                                child: Container(
                                  padding: EdgeInsets.all(0.01.wp),
                                  child: Image(
                                    width: 0.1.wp,
                                    image: AssetImage(
                                        'assets/Component 3 (2).png'),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 0.2.wp,
                              child: MaterialButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {},
                                shape: RoundedRectangleBorder(),
                                child: Container(
                                  padding: EdgeInsets.all(0.01.wp),
                                  child: Image(
                                    width: 0.1.wp,
                                    image: AssetImage('assets/Component 2.png'),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
