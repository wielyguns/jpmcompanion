import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/provider/dashboardViewModel.dart';
import 'package:jpmcompanion/widget/barChartLine.dart';
import 'package:jpmcompanion/widget/chartLine.dart';
import 'package:jpmcompanion/widget/dashboardLineChart1.dart';
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
                        margin: EdgeInsets.only(top: 0.04.hp),
                        padding: EdgeInsets.symmetric(horizontal: 0.04.wp),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 0.02.hp),
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
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 0.04.wp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                elevation: 5,
                                child: Container(
                                  width: 0.42.wp,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 0.01.hp,
                                          horizontal: 0.02.wp,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Pendapatan',
                                              style: TextStyle(color: textGrey),
                                            ),
                                            Container(
                                              width: 0.1.wp,
                                              height: 0.1.wp,
                                              alignment: Alignment.center,
                                              child: MaterialButton(
                                                onPressed: () {},
                                                elevation: 0,
                                                color: Colors.white,
                                                child: Icon(
                                                  FontAwesomeIcons.ellipsisH,
                                                  color: textGrey,
                                                ),
                                                padding: EdgeInsets.all(0),
                                                shape: CircleBorder(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 0.02.wp,
                                        ),
                                        child: LineChartSample5(),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 0.02.hp,
                                          bottom: 0.01.hp,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(children: [
                                                WidgetSpan(
                                                  child: Icon(
                                                    FontAwesomeIcons
                                                        .solidCircle,
                                                    color: purpleLightTheme,
                                                    size: 45.ssp,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '\nSept',
                                                  style: TextStyle(
                                                    color: textGrey,
                                                    fontFamily: 'PlexSans',
                                                  ),
                                                )
                                              ]),
                                            ),
                                            RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(children: [
                                                WidgetSpan(
                                                  child: Icon(
                                                    FontAwesomeIcons
                                                        .solidCircle,
                                                    color: purpleChart,
                                                    size: 45.ssp,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '\nOkt',
                                                  style: TextStyle(
                                                    color: textGrey,
                                                    fontFamily: 'PlexSans',
                                                  ),
                                                )
                                              ]),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
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
            ),
          ),
        ),
      ),
    );
  }
}
