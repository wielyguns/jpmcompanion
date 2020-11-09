import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/provider/mapSelectViewModel.dart';
import 'package:jpmcompanion/widget/chooseFromMap.dart';
import 'package:jpmcompanion/widget/labelMap.dart';
import 'package:jpmcompanion/widget/mapList.dart';
import 'package:jpmcompanion/widget/recentMapList.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:stacked/stacked.dart';

class MapSelectView extends StatefulWidget {
  final Position position;

  const MapSelectView({Key key, this.position}) : super(key: key);
  @override
  _MapSelectViewState createState() => _MapSelectViewState();
}

class _MapSelectViewState extends State<MapSelectView> {
  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-7.328025, 112.791785),
    zoom: 15,
  );
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MapSelectViewModel(),
      onModelReady: (model) => model.init(context),
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: WillPopScope(
          onWillPop: () {
            return model.closeSnap();
          },
          child: Scaffold(
            key: model.scaffoldKey,
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Container(
                  height: 1.hp,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    markers: Set.from(model.marker),
                    onMapCreated: (GoogleMapController controller) {
                      model.initController(controller);
                    },
                    padding: EdgeInsets.symmetric(vertical: 0.2.hp),
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: true,
                    myLocationEnabled: false,
                    onCameraMove: (CameraPosition position) {
                      model.onCameraMove(position);
                    },
                  ),
                ),
                AnimatedPositioned(
                  top: model.top,
                  right: 0,
                  left: 0,
                  duration: Duration(milliseconds: 200),
                  child: AnimatedContainer(
                    color: Colors.white.withOpacity((model.isFocused) ? 1 : 0),
                    padding: EdgeInsets.only(top: 0.05.hp, bottom: 0.02.hp),
                    duration: Duration(milliseconds: 200),
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
                      ),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            width: 1.wp,
                            child: TextField(
                              controller: model.search,
                              readOnly: (model.isFocused) ? false : true,
                              onTap: () {
                                model.openSnap();
                              },
                              onChanged: (value) {
                                model.runFilter(value);
                              },
                              decoration: InputDecoration(
                                hintText: 'Cari Disini',
                                contentPadding: EdgeInsets.only(
                                  left: 0.12.wp,
                                  right: 0.12.wp,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(50.0),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(
                                      hexStringToHexInt('#5A4CF4'),
                                    ),
                                    width: 2.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(50.0),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(50.0),
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
                            left: 0.02.wp,
                            child: Container(
                              width: 0.07.wp,
                              alignment: Alignment.center,
                              child: MaterialButton(
                                splashColor: purpleLightTheme,
                                onPressed: () {
                                  if (model.isFocused) {
                                    model.closeSnap();
                                  } else {
                                    model.openSnap();
                                  }
                                },
                                elevation: 0,
                                color: Colors.white,
                                child: (!model.isFocused)
                                    ? Image(
                                        width: 0.07.wp,
                                        image: AssetImage(
                                          'assets/magnificient.png',
                                        ),
                                      )
                                    : Image(
                                        width: 0.04.wp,
                                        image: AssetImage(
                                          'assets/Asset 53300 1.png',
                                        ),
                                      ),
                                padding: EdgeInsets.all(0),
                                shape: CircleBorder(),
                              ),
                            ),
                          ),
                          if (model.search.text != '' && model.isFocused)
                            Positioned(
                              right: 0.04.wp,
                              child: Container(
                                width: 0.07.wp,
                                alignment: Alignment.center,
                                child: MaterialButton(
                                  splashColor: purpleLightTheme,
                                  onPressed: () {
                                    model.clearFilter();
                                  },
                                  elevation: 0,
                                  color: Colors.white,
                                  child: Image(
                                    width: 0.04.wp,
                                    image: AssetImage(
                                      'assets/times.png',
                                    ),
                                  ),
                                  padding: EdgeInsets.all(0),
                                  shape: CircleBorder(),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  bottom: model.bottom,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.04.wp,
                      vertical: 0.01.hp,
                    ),
                    child: FlatButton(
                      color: purpleTheme,
                      onPressed: () {
                        model.chooseLocation();
                      },
                      child: Container(
                        child: Text(
                          'Pilih lokasi ini',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.ssp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "PlexSans",
                          ),
                        ),
                      ),
                    ),
                  ),
                  duration: Duration(milliseconds: 200),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: 1.wp,
                    height: 0.87.hp,
                    child: SnappingSheet(
                      snappingSheetController: model.snappingSheetController,
                      snapPositions: [
                        SnapPosition(positionPixel: 0),
                        SnapPosition(positionPixel: 0.87.hp),
                      ],
                      sheetBelow: SnappingSheetContent(
                        heightBehavior: SnappingSheetHeight.fit(),
                        child: Container(
                          width: 1.wp,
                          height: 0.5.hp,
                          color: Colors.white,
                          child: NotificationListener<
                              OverscrollIndicatorNotification>(
                            onNotification: (notification) {
                              notification.disallowGlow();
                              return;
                            },
                            child: SingleChildScrollView(
                              child: (model.search.text == '')
                                  ? Column(
                                      children: [
                                        Container(
                                          width: 1.wp,
                                          height: 0.06.hp,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(1, 1),
                                                spreadRadius: 0,
                                                blurRadius: 5,
                                                color: textGrey,
                                              )
                                            ],
                                          ),
                                          child: NotificationListener<
                                              OverscrollIndicatorNotification>(
                                            onNotification: (notification) {
                                              notification.disallowGlow();
                                              return;
                                            },
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    LabelMap(
                                                      margin: EdgeInsets.only(
                                                        left: 0.04.wp,
                                                      ),
                                                      title: 'Jpm Surabaya',
                                                      lat: '7.123123123',
                                                      long: '-112.34543543',
                                                      divider: true,
                                                    ),
                                                    LabelMap(
                                                      title: 'Jpm Jember',
                                                      lat: '7.63432423',
                                                      long: '-112.34543543',
                                                      divider: true,
                                                    ),
                                                    LabelMap(
                                                      title: 'Jpm Nganjuk',
                                                      lat: '7.63432423',
                                                      long: '-112.34543543',
                                                      divider: true,
                                                    ),
                                                    LabelMap(
                                                      title: 'Jpm Solo',
                                                      lat: '7.63432423',
                                                      long: '-112.34543543',
                                                      divider: true,
                                                    ),
                                                    LabelMap(
                                                      title: 'Jpm Semarang',
                                                      lat: '7.63432423',
                                                      long: '-112.34543543',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 0.01.hp,
                                            horizontal: 0.05.wp,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Recent',
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "PlexSans",
                                                    color: purpleTheme,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 120.ssp,
                                                child: MaterialButton(
                                                  splashColor: purpleLightTheme,
                                                  onPressed: () {
                                                    model.clearRecent();
                                                  },
                                                  elevation: 1,
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Icon(
                                                      FontAwesomeIcons.trash,
                                                      size: 40.ssp,
                                                      color: Colors.redAccent,
                                                    ),
                                                  ),
                                                  shape: CircleBorder(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: NotificationListener<
                                              OverscrollIndicatorNotification>(
                                            onNotification: (notification) {
                                              notification.disallowGlow();
                                              return;
                                            },
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: model
                                                          .recentPrediction
                                                          .reversed
                                                          .map<Widget>((e) {
                                                        return RecentMapList(
                                                          result: e,
                                                          onPressed: (value) {
                                                            model.openLocation(
                                                              value,
                                                            );
                                                          },
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                  if (model.recentPrediction
                                                          .length ==
                                                      0)
                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          Image(
                                                            width: 0.7.wp,
                                                            image: AssetImage(
                                                              'assets/Asset 1123300 1.png',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 0.02.hp,
                                                          ),
                                                          Container(
                                                            width: 1.wp,
                                                            child: RichText(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                        'Belum ada data\n',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          Color(
                                                                        hexStringToHexInt(
                                                                            '#737373'),
                                                                      ),
                                                                      fontSize:
                                                                          60.ssp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        'Belum ada data baru baru ini',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          Color(
                                                                        hexStringToHexInt(
                                                                            '#B8B8B8'),
                                                                      ),
                                                                      fontSize:
                                                                          40.ssp,
                                                                    ),
                                                                  ),
                                                                ],
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
                                      ],
                                    )
                                  : Container(
                                      child: Column(
                                        children: [
                                          if (model.search.text != '')
                                            ChooseFromMap(
                                              onPressed: () {
                                                model.chooseFromMap();
                                              },
                                            ),
                                          Container(
                                            child: Column(
                                              children: model.locationPrediction
                                                  .map<Widget>((e) {
                                                return MapList(
                                                  onPressed: (value) {
                                                    model.selectLocation(value);
                                                  },
                                                  result: e,
                                                );
                                              }).toList(),
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
