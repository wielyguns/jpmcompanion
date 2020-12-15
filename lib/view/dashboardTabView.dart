import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/provider/dashboardTabViewModel.dart';
import 'package:jpmcompanion/widget/dashboardCard.dart';
import 'package:jpmcompanion/widget/dashboardGraphicReport.dart';
import 'package:jpmcompanion/widget/dashboardHeader.dart';
import 'package:jpmcompanion/widget/dashboardSearchBar.dart';
import 'package:stacked/stacked.dart';
import 'package:jpmcompanion/widget/shortcutWidget.dart';

class DashboardTabView extends StatefulWidget {
  final List<Map> shortcut;
  final Function generateShortcut;
  const DashboardTabView({
    Key key,
    this.shortcut,
    this.generateShortcut,
  }) : super(key: key);
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
                DashboardHeader(
                  kirimanHariIni: model.dataDashboard != null
                      ? model.dataDashboard.kirimanHariIni
                      : '',
                ),
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
                          spotsName: model.spotsName,
                        ),
                        DashboardGraphicReport(
                          title: 'Delivery Order',
                          spots: model.deliveryOrderSpots,
                          spotsName: model.spotsName,
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
                      child: (model.dataDashboard != null)
                          ? Container(
                              margin: EdgeInsets.only(bottom: 0.02.hp),
                              child: Row(
                                children: [
                                  DashboardCard(
                                    total:
                                        model.dataDashboard.manifestedBulanIni,
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
                                    total: model.dataDashboard.transitBulanIni,
                                    title: 'Barang Dalam\nTransit',
                                    color: Color(
                                      hexStringToHexInt('#6AD0B8'),
                                    ),
                                    margin: EdgeInsets.only(
                                      right: 0.04.wp,
                                    ),
                                  ),
                                  DashboardCard(
                                    total:
                                        model.dataDashboard.deliveredBulanIni,
                                    title: 'Barang Sampai\nTujuan',
                                    color: Color(
                                      hexStringToHexInt('#8684F3'),
                                    ),
                                    margin: EdgeInsets.only(
                                      right: 0.04.wp,
                                    ),
                                  ),
                                  DashboardCard(
                                    total: model.dataDashboard.pendingBulanIni,
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
                            )
                          : Container(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0.02.hp, bottom: 0.02.hp),
                  padding: EdgeInsets.symmetric(horizontal: 0.04.wp),
                  child: Text(
                    'Shortcut',
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
                    children: widget.shortcut.asMap().entries.map((e) {
                      return FlatButton(
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          if (e.value['isSet']) {
                            Navigator.of(context).pushNamed(
                              e.value['route'],
                              arguments: e.value['param'],
                            );
                          } else {
                            await Navigator.of(context).pushNamed(
                              shortcutMenuRoute,
                              arguments: e.key + 1,
                            );
                            widget.generateShortcut();
                          }
                        },
                        onLongPress: () async {
                          await Navigator.of(context).pushNamed(
                            shortcutMenuRoute,
                            arguments: e.key + 1,
                          );
                          widget.generateShortcut();
                        },
                        child: ShortcutWidget(
                          data: e.value,
                          isSet: e.value['isSet'],
                        ),
                      );
                    }).toList(),
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
