import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/provider/dashboardTabViewModel.dart';
import 'package:jpmcompanion/widget/dashboardCard.dart';
import 'package:jpmcompanion/widget/dashboardGraphicReport.dart';
import 'package:jpmcompanion/widget/dashboardHeader.dart';
import 'package:jpmcompanion/widget/dashboardSearchBar.dart';
import 'package:stacked/stacked.dart';

class DashboardTabView extends StatefulWidget {
  @override
  _DashboardTabViewState createState() => _DashboardTabViewState();
}

class _DashboardTabViewState extends State<DashboardTabView> {
  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.init(context),
      viewModelBuilder: () => DashboardTabViewModel(),
      builder: (context, model, child) {
        return SingleChildScrollView(
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
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (OverscrollIndicatorNotification scroll) {
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
                          onPressed: () {
                            Navigator.of(context).pushNamed(purchaseOrderRoute);
                          },
                          shape: RoundedRectangleBorder(),
                          child: Container(
                            constraints: BoxConstraints(minHeight: 0.1.hp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(0.01.wp),
                                  child: Image(
                                    width: 0.1.wp,
                                    image: AssetImage(
                                      'assets/Asset 47300 2.png',
                                    ),
                                  ),
                                ),
                                Text(
                                  'Input SO',
                                  style: TextStyle(
                                    color: Color(
                                      hexStringToHexInt('#736B6D'),
                                    ),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "PlexSans",
                                    fontSize: 35.ssp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 0.2.wp,
                        child: MaterialButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.of(context).pushNamed(updateDoRoute);
                          },
                          shape: RoundedRectangleBorder(),
                          child: Container(
                            constraints: BoxConstraints(
                              minHeight: 0.1.hp,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(0.01.wp),
                                  child: Image(
                                    width: 0.1.wp,
                                    image: AssetImage(
                                      'assets/Asset 48300 1.png',
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Update Do',
                                    style: TextStyle(
                                      color: Color(
                                        hexStringToHexInt('#736B6D'),
                                      ),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "PlexSans",
                                      fontSize: 35.ssp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 0.2.wp,
                        child: MaterialButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            Map data = {
                              "route": trackingDoRoute,
                            };

                            Navigator.of(context).pushNamed(
                              listDoRoute,
                              arguments: data,
                            );
                          },
                          shape: RoundedRectangleBorder(),
                          child: Container(
                            constraints: BoxConstraints(minHeight: 0.1.hp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(0.01.wp),
                                  child: Image(
                                    width: 0.12.wp,
                                    image: AssetImage(
                                      'assets/Asset 50 1.png',
                                    ),
                                  ),
                                ),
                                Text(
                                  'Tracking DO',
                                  style: TextStyle(
                                    color: Color(
                                      hexStringToHexInt('#736B6D'),
                                    ),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "PlexSans",
                                    fontSize: 35.ssp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 0.2.wp,
                        child: MaterialButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            messageToast('On Develop', Colors.black);
                          },
                          shape: RoundedRectangleBorder(),
                          child: Container(
                            constraints: BoxConstraints(minHeight: 0.1.hp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(0.01.wp),
                                  child: Image(
                                    width: 0.1.wp,
                                    image: AssetImage(
                                      'assets/Asset 52 1.png',
                                    ),
                                  ),
                                ),
                                Text(
                                  'Master',
                                  style: TextStyle(
                                    color: Color(
                                      hexStringToHexInt('#736B6D'),
                                    ),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "PlexSans",
                                    fontSize: 35.ssp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.02.hp,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
