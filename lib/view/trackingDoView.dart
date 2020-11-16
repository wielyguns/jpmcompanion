import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/apiConst.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/deliveryOrderModel.dart';
import 'package:jpmcompanion/model/trackingDoModel.dart';
import 'package:jpmcompanion/provider/trackingDoViewModel.dart';
import 'package:jpmcompanion/widget/loadingScreen.dart';
import 'package:stacked/stacked.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extend;

class TrackingDoView extends StatefulWidget {
  final DeliveryOrder param;

  const TrackingDoView({Key key, this.param}) : super(key: key);
  @override
  _TrackingDoViewState createState() => _TrackingDoViewState();
}

class _TrackingDoViewState extends State<TrackingDoView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TrackingDoViewModel(),
      onModelReady: (model) => model.init(context, widget.param),
      builder: (context, model, child) => LoadingScreen(
        showLoadingApi: model.isBusy,
        showLoadingScreen: false,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            key: model.scaffoldKey,
            backgroundColor: Colors.white,
            body: NestedScrollViewRefreshIndicator(
              onRefresh: () {
                return model.getTracking();
              },
              child: extend.NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    PreferredSize(
                      preferredSize: Size.fromHeight(kToolbarHeight * 2),
                      child: SliverAppBar(
                        elevation: 0,
                        leading: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.arrowAltCircleLeft,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        title: Text(
                          'Tracking Delivery Order',
                          style: TextStyle(
                            fontFamily: "PlexSans",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Colors.amber,
                        pinned: false,
                        flexibleSpace: Container(
                          margin: EdgeInsets.symmetric(horizontal: 0.04.wp),
                          alignment: Alignment.bottomRight,
                          child: Image(
                            image: AssetImage('assets/Asset 55300 1.png'),
                          ),
                        ),
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(kToolbarHeight),
                          child: Container(
                            alignment: Alignment.topRight,
                            width: 1.wp,
                            child: Container(
                              width: 1.wp,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [Colors.amber, Colors.amber],
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 0.09.hp,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [Colors.amber, Colors.amber],
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    width: double.infinity,
                                    height: 0.09.hp,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [Colors.white, Colors.white],
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                      ),
                                    ),
                                    child: Container(
                                      width: 1.wp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(
                                          hexStringToHexInt('#F9F9F9'),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(1, 2),
                                            color: borderBox,
                                            blurRadius: 8,
                                          )
                                        ],
                                      ),
                                      margin: EdgeInsets.only(
                                        left: 0.04.wp,
                                        right: 0.04.wp,
                                        bottom: 0.01.hp,
                                      ),
                                      child: Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          Container(
                                            width: 1.wp,
                                            child: TextField(
                                              readOnly: true,
                                              onTap: () {
                                                Map data = {
                                                  "route": trackingDoRoute,
                                                };

                                                Navigator.of(context).pushNamed(
                                                  listDoRoute,
                                                  arguments: data,
                                                );
                                              },
                                              decoration: InputDecoration(
                                                hintText: 'No Tracking',
                                                contentPadding: EdgeInsets.only(
                                                  left: 0.05.wp,
                                                  right: 0.12.wp,
                                                ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    const Radius.circular(
                                                      50.0,
                                                    ),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Color(
                                                      hexStringToHexInt(
                                                        '#5A4CF4',
                                                      ),
                                                    ),
                                                    width: 2.0,
                                                  ),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    const Radius.circular(
                                                      50.0,
                                                    ),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    const Radius.circular(
                                                      50.0,
                                                    ),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                errorStyle: TextStyle(
                                                  height: 0,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 0.04.wp,
                                            child: Container(
                                              width: 0.07.wp,
                                              alignment: Alignment.center,
                                              child: MaterialButton(
                                                splashColor: purpleLightTheme,
                                                onPressed: () {},
                                                elevation: 0,
                                                color: Colors.white,
                                                child: Image(
                                                  width: 0.07.wp,
                                                  image: AssetImage(
                                                    'assets/magnificient.png',
                                                  ),
                                                ),
                                                padding: EdgeInsets.all(0),
                                                shape: CircleBorder(),
                                              ),
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
                        ),
                      ),
                    ),
                  ];
                },
                body: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0.05.hp, bottom: 0.02.hp),
                        child: Row(
                          children: [
                            Container(
                              height: 0.03.hp,
                              child: VerticalDivider(
                                color: Color(
                                  hexStringToHexInt(
                                    '#FF5373',
                                  ),
                                ),
                                thickness: 0.015.wp,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  '${widget.param.nomor}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "PlexSans",
                                    fontSize: 50.ssp,
                                    color: Color(
                                      hexStringToHexInt(
                                        '#FF5373',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (model.tracking != null)
                        Container(
                          alignment: Alignment.center,
                          width: 1.wp,
                          color: Colors.amber,
                          padding: EdgeInsets.symmetric(
                            vertical: 0.02.hp,
                          ),
                          constraints: BoxConstraints(maxHeight: 0.2.hp),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: [
                              TimelineTile(
                                axis: TimelineAxis.horizontal,
                                alignment: TimelineAlign.center,
                                isFirst: true,
                                indicatorStyle: (model.tracking.trackingType
                                            .levelProgress >=
                                        1)
                                    ? model.completeTracking(context)
                                    : model.onProgressTracking(context),
                                beforeLineStyle: LineStyle(
                                  color: purpleTheme,
                                  thickness: 6,
                                ),
                                afterLineStyle: LineStyle(
                                  color: purpleTheme,
                                  thickness: 6,
                                ),
                                startChild: Container(
                                  margin: EdgeInsets.only(bottom: 0.01.hp),
                                  constraints: BoxConstraints(
                                    minWidth: 0.33.wp,
                                  ),
                                  child: Image(
                                    color: purpleTheme,
                                    image: AssetImage(
                                      'assets/Asset 78300 2.png',
                                    ),
                                  ),
                                ),
                                endChild: Container(
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                    minWidth: 0.33.wp,
                                  ),
                                  child: Container(
                                    child: Text(
                                      'Pesanan\nDibuat',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: purpleTheme,
                                        fontSize: 40.ssp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "PlexSans",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TimelineTile(
                                axis: TimelineAxis.horizontal,
                                alignment: TimelineAlign.center,
                                indicatorStyle: (model.tracking.trackingType
                                            .levelProgress >=
                                        4)
                                    ? model.completeTracking(context)
                                    : model.onProgressTracking(context),
                                beforeLineStyle: LineStyle(
                                  color: (model.tracking.trackingType
                                              .levelProgress >=
                                          1)
                                      ? purpleTheme
                                      : Colors.white,
                                  thickness: 6,
                                ),
                                afterLineStyle: LineStyle(
                                  color: (model.tracking.trackingType
                                              .levelProgress >=
                                          4)
                                      ? purpleTheme
                                      : Colors.white,
                                  thickness: 6,
                                ),
                                startChild: Container(
                                  margin: EdgeInsets.only(bottom: 0.01.hp),
                                  constraints: BoxConstraints(
                                    minWidth: 0.33.wp,
                                  ),
                                  child: Image(
                                    color: (model.tracking.trackingType
                                                .levelProgress >=
                                            4)
                                        ? purpleTheme
                                        : Colors.white,
                                    image: AssetImage(
                                      'assets/Asset 82300 1.png',
                                    ),
                                  ),
                                ),
                                endChild: Container(
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                    minWidth: 0.33.wp,
                                  ),
                                  child: Container(
                                    child: Text(
                                      'Dalam\nPerjalanan',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: (model.tracking.trackingType
                                                    .levelProgress >=
                                                4)
                                            ? purpleTheme
                                            : Colors.white,
                                        fontSize: 40.ssp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "PlexSans",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TimelineTile(
                                axis: TimelineAxis.horizontal,
                                alignment: TimelineAlign.center,
                                isLast: true,
                                indicatorStyle: (model.tracking.trackingType
                                            .levelProgress >=
                                        5)
                                    ? model.completeTracking(context)
                                    : (model.tracking.trackingType
                                                .levelProgress >=
                                            4)
                                        ? model.onProgressTracking(context)
                                        : model.onWaitingTracking(context),
                                beforeLineStyle: LineStyle(
                                  color: (model.tracking.trackingType
                                              .levelProgress >=
                                          4)
                                      ? purpleTheme
                                      : Colors.white,
                                  thickness: 6,
                                ),
                                afterLineStyle: LineStyle(
                                  color: (model.tracking.trackingType
                                              .levelProgress >=
                                          5)
                                      ? purpleTheme
                                      : Colors.white,
                                  thickness: 6,
                                ),
                                startChild: Container(
                                  margin: EdgeInsets.only(bottom: 0.01.hp),
                                  constraints: BoxConstraints(
                                    minWidth: 0.33.wp,
                                  ),
                                  child: Image(
                                    color: (model.tracking.trackingType
                                                .levelProgress >=
                                            5)
                                        ? purpleTheme
                                        : Colors.white,
                                    image: AssetImage(
                                      'assets/Asset 83300 1.png',
                                    ),
                                  ),
                                ),
                                endChild: Container(
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                    minWidth: 0.33.wp,
                                  ),
                                  child: Container(
                                    child: Text(
                                      'Pesanan\nDiterima',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: (model.tracking.trackingType
                                                    .levelProgress >=
                                                5)
                                            ? purpleTheme
                                            : Colors.white,
                                        fontSize: 40.ssp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "PlexSans",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Expanded(
                        child: Container(
                          width: 1.wp,
                          child: NotificationListener<
                              OverscrollIndicatorNotification>(
                            onNotification: (notification) {
                              notification.disallowGlow();
                              return;
                            },
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  if (model.tracking != null &&
                                      model.tracking.signature != null)
                                    Container(
                                      margin: EdgeInsets.only(
                                        right: 0.05.wp,
                                        left: 0.05.wp,
                                        top: 0.02.hp,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Image(
                                              width: 0.1.wp,
                                              image: AssetImage(
                                                'assets/Asset 61300 2.png',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.only(left: 0.05.wp),
                                            child: Text(
                                              'Bukti Pengiriman',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 50.ssp,
                                                fontWeight: FontWeight.bold,
                                                color: Color(
                                                  hexStringToHexInt('#505050'),
                                                ),
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (model.tracking != null &&
                                      model.tracking.signature != null)
                                    Container(
                                      margin: EdgeInsets.only(
                                        right: 0.05.wp,
                                        left: 0.05.wp,
                                        top: 0.02.hp,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              bottom: 0.01.hp,
                                            ),
                                            child: Text(
                                              'Tanda tangan penerima',
                                              style: TextStyle(
                                                color: Color(
                                                  hexStringToHexInt(
                                                    '#9B9B9B',
                                                  ),
                                                ),
                                                fontSize: 40.ssp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              bottom: 0.02.hp,
                                            ),
                                            child: Image.network(
                                              '$baseApi/${model.tracking.signature}',
                                              fit: BoxFit.fill,
                                              height: 0.1.hp,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              bottom: 0.02.hp,
                                            ),
                                            child: Text(
                                              'Nama Penerima',
                                              style: TextStyle(
                                                color: Color(
                                                  hexStringToHexInt(
                                                    '#9B9B9B',
                                                  ),
                                                ),
                                                fontSize: 40.ssp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              bottom: 0.02.hp,
                                            ),
                                            child: Text(
                                              '${model.tracking.penerima}',
                                              style: TextStyle(
                                                color: textGrey,
                                                fontSize: 40.ssp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Container(
                                    color: Color(hexStringToHexInt('#f8f9fa')),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 0.05.wp,
                                      vertical: 0.02.hp,
                                    ),
                                    child: (model.tracking != null)
                                        ? Column(
                                            children: model.tracking.trackingD
                                                .asMap()
                                                .entries
                                                .map<Widget>((e) {
                                              TrackingD data = e.value;
                                              return TimelineTile(
                                                axis: TimelineAxis.vertical,
                                                alignment: TimelineAlign.start,
                                                isFirst:
                                                    (e.key == 0) ? true : false,
                                                isLast: (e.key ==
                                                        model.tracking.trackingD
                                                                .length -
                                                            1)
                                                    ? true
                                                    : false,
                                                indicatorStyle: IndicatorStyle(
                                                  width: 30,
                                                  height: 30,
                                                  color: purpleTheme,
                                                  iconStyle: IconStyle(
                                                    color: Colors.white,
                                                    iconData: Icons.check,
                                                    fontSize: 50.ssp,
                                                  ),
                                                ),
                                                beforeLineStyle: LineStyle(
                                                  color: purpleTheme,
                                                  thickness: 6,
                                                ),
                                                afterLineStyle: LineStyle(
                                                  color: purpleTheme,
                                                  thickness: 6,
                                                ),
                                                endChild: Container(
                                                  margin: EdgeInsets.only(
                                                    left: 0.05.wp,
                                                  ),
                                                  alignment: Alignment.topLeft,
                                                  constraints: BoxConstraints(
                                                    minHeight: 0.1.hp,
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          '${data.deskripsi}',
                                                          style: TextStyle(
                                                            color: textGrey,
                                                            fontSize: 40.ssp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                "PlexSans",
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          'Senin 5 oct 2020 12:03',
                                                          style: TextStyle(
                                                            color: Color(
                                                              hexStringToHexInt(
                                                                '#9B9B9B',
                                                              ),
                                                            ),
                                                            fontSize: 40.ssp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                "PlexSans",
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image(
                                                width: 0.5.wp,
                                                image: AssetImage(
                                                    'assets/Asset 1123300 1.png'),
                                              ),
                                              SizedBox(
                                                height: 0.02.hp,
                                              ),
                                              Container(
                                                width: 1.wp,
                                                child: RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            'Data Tidak Tersedia\n',
                                                        style: TextStyle(
                                                          color: Color(
                                                            hexStringToHexInt(
                                                                '#737373'),
                                                          ),
                                                          fontSize: 60.ssp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            'Data yang anda cari tidak ditemukan atau salah',
                                                        style: TextStyle(
                                                          color: Color(
                                                            hexStringToHexInt(
                                                                '#B8B8B8'),
                                                          ),
                                                          fontSize: 40.ssp,
                                                        ),
                                                      ),
                                                    ],
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
