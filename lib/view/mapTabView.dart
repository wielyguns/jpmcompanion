import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/model/trackingPositionModel.dart';
import 'package:jpmcompanion/provider/mapTabViewModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:jpmcompanion/widget/markerIcon.dart';
import 'package:jpmcompanion/widget/trackingItemList.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:stacked/stacked.dart';

class MapTabView extends StatefulWidget {
  final TrackingResult result;
  final Function(String) onSnapOpen;

  const MapTabView({Key key, this.result, this.onSnapOpen}) : super(key: key);
  @override
  _MapTabViewState createState() => _MapTabViewState();
}

class _MapTabViewState extends State<MapTabView> {
  Timer _timer;
  LatLng _pos = LatLng(-7.328025, 112.791785);
  var long;
  var bitmapImage;
  var initial;
  bool showInfoWindow = false;
  bool snapVisibility = false;
  double grabbingHeight = 0;
  TrackingPosition _data;
  List<Marker> _marker = [];
  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-7.328025, 112.791785),
    zoom: 15,
  );
  SnappingSheetController _snappingSheetController = SnappingSheetController();
  List<Polyline> _track = [];
  GoogleMapController _controller;
  TrackingResult trackingResult;
  List<LatLng> _listPoint = [];
  PointObject point = PointObject();
  initState() {
    if (!mounted) {
      return;
    }

    trackingStream();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();

    super.dispose();
  }

  trackingStream() async {
    if (!mounted) {
      return;
    }

    if (_timer != null) {
      _timer.cancel();
    }

    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) async {
        if (widget.result.nopol != null) {
          if (!mounted) {
            return;
          }
          setState(() {
            _data = TrackingPosition(
              listNopol: ['${widget.result.nopol}'],
              statusVehicle: null,
              geoCode: null,
            );
          });

          var result = await MainService().getNopolActive(_data);
          if (!mounted) {
            return;
          }
          setState(() {
            if (result['status'] == null) {
              trackingResult = TrackingResult.fromJson(result['Data'][0]);
              addMarker();
            }
          });
        }
      },
    );
  }

  addMarker() async {
    if (trackingResult != null &&
        trackingResult.lat != null &&
        trackingResult.lon != null) {
      if (initial != trackingResult.nopol) {
        _listPoint = [];
      }
      if (trackingResult.lat != _pos.latitude &&
          trackingResult.lon != _pos.longitude) {
        _marker = [];
        _track = [];
        _pos = LatLng(trackingResult.lat, trackingResult.lon);
        point.location = _pos;
        point.child = Container(
          child: TrackingItemList(
            result: trackingResult,
          ),
        );
        _listPoint.add(_pos);

        _track.add(
          Polyline(
            polylineId: PolylineId("route1"),
            color: Colors.blue,
            patterns: [PatternItem.dash(20.0), PatternItem.gap(10)],
            width: 3,
            points: _listPoint,
          ),
        );

        _marker.add(
          Marker(
            markerId: MarkerId('0'),
            position: _pos,
            icon: await getMarkerIcon(
                'assets/truck.jpeg', Size(100, 100), trackingResult),
            draggable: false,
            onTap: () {
              if (!mounted) {
                return;
              }
              setState(() {
                if (showInfoWindow == true) {
                  showInfoWindow = false;
                } else {
                  showInfoWindow = true;
                }
              });
            },
          ),
        );

        setState(() {
          if (initial != trackingResult.nopol) {
            initial = trackingResult.nopol;
            _controller.moveCamera(CameraUpdate.newLatLng(_pos));
          }
        });
      }
    }
  }

  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.init(context),
      viewModelBuilder: () => MapTabViewModel(),
      builder: (context, model, child) => GestureDetector(
        child: Scaffold(
          key: model.locationMapKey,
          body: Stack(
            children: [
              Container(
                child: GoogleMap(
                  markers: Set.from(_marker),
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                  },
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: true,
                  myLocationEnabled: true,
                  polylines: Set.from(_track),
                  onCameraMove: (CameraPosition position) {},
                ),
              ),
              Positioned(
                top: 20,
                right: 0,
                left: 0,
                child: AnimatedOpacity(
                  opacity: (showInfoWindow) ? 1 : 0,
                  duration: Duration(milliseconds: 200),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.92),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 0.02.wp),
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.02.wp,
                        vertical: 0.02.hp,
                      ),
                      child: (trackingResult != null)
                          ? Column(
                              children: [
                                Container(
                                  child: TrackingItemList(
                                    result: trackingResult,
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.1.hp,
                right: 0.04.wp,
                left: 0,
                child: AnimatedOpacity(
                  opacity: (showInfoWindow) ? 1 : 0,
                  duration: Duration(milliseconds: 200),
                  child: Container(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 0.14.wp,
                      height: 0.14.wp,
                      child: RaisedButton(
                        color: Colors.white,
                        shape: CircleBorder(),
                        onPressed: () {
                          if (!mounted) {
                            return;
                          }
                          setState(() {
                            snapVisibility = true;
                            _snappingSheetController.snapToPosition(
                              SnapPosition(
                                positionPixel: 0.6.hp,
                                snappingCurve: Curves.elasticOut,
                                snappingDuration: Duration(milliseconds: 750),
                              ),
                            );
                          });
                        },
                        padding: EdgeInsets.all(0),
                        child: Container(
                          child: Text(
                            'DO',
                            style: TextStyle(
                              fontFamily: "PlexSans",
                              fontWeight: FontWeight.bold,
                              color: purpleTheme,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Visibility(
                  visible: true,
                  child: Container(
                    height: 1.hp,
                    child: SnappingSheet(
                      snappingSheetController: _snappingSheetController,
                      sheetBelow: SnappingSheetContent(
                        child: Container(
                          height: 0.8.hp,
                          color: Colors.white,
                        ),
                        heightBehavior: SnappingSheetHeight.fit(),
                      ),
                      grabbingHeight: grabbingHeight,
                      grabbing: Container(
                        color: Colors.green,
                      ),
                      onMove: (pixelPosition) {
                        if (!mounted) {
                          return;
                        }
                        if (pixelPosition <= 0) {
                          grabbingHeight = 0;
                          widget.onSnapOpen('close');
                        } else {
                          widget.onSnapOpen('open');
                          grabbingHeight = 20;
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
