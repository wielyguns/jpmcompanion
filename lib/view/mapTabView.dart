import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/model/trackingPositionModel.dart';
import 'package:jpmcompanion/provider/mapTabViewModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:jpmcompanion/widget/markerIcon.dart';
import 'package:stacked/stacked.dart';

class MapTabView extends StatefulWidget {
  final TrackingResult result;

  const MapTabView({Key key, this.result}) : super(key: key);
  @override
  _MapTabViewState createState() => _MapTabViewState();
}

class _MapTabViewState extends State<MapTabView> {
  Timer _timer;
  LatLng _pos = LatLng(-7.328025, 112.791785);
  var long;
  var bitmapImage;
  var initial;
  TrackingPosition _data;
  List<Marker> _marker = [];
  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-7.328025, 112.791785),
    zoom: 20,
  );
  GoogleMapController _controller;
  TrackingResult trackingResult;
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
          setState(() {
            _data = TrackingPosition(
              listNopol: ['"${widget.result.nopol}"'],
              statusVehicle: 2,
              geoCode: null,
            );
          });

          print('DATA NOPOL => ${_data.listNopol}');

          var result = await MainService().getNopolActive(_data);
          print('NOPOL BARU => ${result['Data'][0]['nopol']}');

          setState(() {
            trackingResult = TrackingResult.fromJson(result['Data'][0]);
            addMarker();
          });
        }
      },
    );
  }

  addMarker() async {
    print('NOPOL LAMA => ${trackingResult.nopol}');
    if (trackingResult != null &&
        trackingResult.lat != null &&
        trackingResult.lon != null) {
      if (trackingResult.lat != _pos.latitude &&
          trackingResult.lon != _pos.longitude) {
        _marker = [];
        _pos = LatLng(trackingResult.lat, trackingResult.lon);
        _marker.add(
          Marker(
            markerId: MarkerId('0'),
            position: _pos,
            icon: await getMarkerIcon('assets/truck.jpeg', Size(150, 150)),
            draggable: false,
            infoWindow: InfoWindow.noText,
          ),
        );
        setState(() {
          _controller.moveCamera(CameraUpdate.newLatLng(_pos));
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
                  onCameraMove: (CameraPosition position) {
                    // if (marker.length > 0) {
                    //   Marker mark = marker[0];
                    //   Marker updatedMarker = mark.copyWith(
                    //     positionParam: position.target,
                    //   );

                    //   setState(() {
                    //     marker[0] = updatedMarker;
                    //   });
                    // }
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                child: Container(
                  width: 1.wp,
                  padding: EdgeInsets.symmetric(horizontal: 0.04.wp),
                  child: FlatButton(
                    color: purpleLightTheme,
                    onPressed: () {
                      model.addMarker();
                    },
                    child: Text('add marker'),
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
