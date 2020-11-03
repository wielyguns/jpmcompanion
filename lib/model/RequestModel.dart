import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BottomBarModel {
  String icon;
  String title;
  String route;
  String color;

  BottomBarModel({this.icon, this.title, this.route, this.color});

  BottomBarModel.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    route = json['route'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['route'] = this.route;
    data['color'] = this.color;
    return data;
  }
}

class TrackingPosition {
  List<dynamic> listNopol;
  int statusVehicle;
  String geoCode;

  TrackingPosition({this.listNopol, this.statusVehicle, this.geoCode});

  TrackingPosition.fromJson(Map<String, dynamic> json) {
    listNopol = json['list_nopol'].cast<dynamic>();
    statusVehicle = json['status_vehicle'];
    geoCode = json['geo_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list_nopol'] = this.listNopol;
    data['status_vehicle'] = this.statusVehicle;
    data['geo_code'] = this.geoCode;
    return data;
  }
}

class PointObject {
  Widget child;
  LatLng location;

  PointObject({this.child, this.location});
}
