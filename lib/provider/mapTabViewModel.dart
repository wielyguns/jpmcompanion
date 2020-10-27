import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jpmcompanion/widget/markerIcon.dart';
import 'package:stacked/stacked.dart';

class MapTabViewModel extends BaseViewModel {
  // SETTER
  GlobalKey<ScaffoldState> _locationMapKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  LatLng _pos;
  var long;
  var bitmapImage;
  List<Marker> _marker = [];
  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-7.328025, 112.791785),
    zoom: 20,
  );

  // GETTER
  CameraPosition get kGooglePlex => _kGooglePlex;
  LatLng get pos => _pos;
  List<Marker> get marker => _marker;
  GlobalKey<ScaffoldState> get locationMapKey => _locationMapKey;
  Completer<GoogleMapController> get controller => _controller;

  init() {
    _pos = LatLng(-7.328025, 112.791785);
    _kGooglePlex = CameraPosition(target: _pos, zoom: 20, tilt: 0);
  }

  addMarker() async {
    _pos = LatLng(-7.328025, 112.791785);
    marker.add(
      Marker(
        markerId: MarkerId('0'),
        position: pos,
        icon: await getMarkerIcon('assets/truck.jpeg', Size(150, 150)),
        draggable: false,
        infoWindow: InfoWindow.noText,
      ),
    );
    notifyListeners();
  }
}
