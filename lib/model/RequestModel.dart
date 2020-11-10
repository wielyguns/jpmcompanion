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

class ShippingOrder {
  String nomor;
  String tanggal;
  String asalId;
  String latitude;
  String longitude;
  String nopol;
  String jumlahUnit;
  String alamat;

  ShippingOrder({
    this.nomor,
    this.tanggal,
    this.asalId,
    this.latitude,
    this.longitude,
    this.nopol,
    this.jumlahUnit,
    this.alamat,
  });

  ShippingOrder.fromJson(Map<String, dynamic> json) {
    nomor = json['nomor'];
    tanggal = json['tanggal'];
    asalId = json['asal_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    nopol = json['nopol'];
    jumlahUnit = json['jumlah_unit'];
    alamat = json['alamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomor'] = this.nomor;
    data['tanggal'] = this.tanggal;
    data['asal_id'] = this.asalId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['nopol'] = this.nopol;
    data['jumlah_unit'] = this.jumlahUnit;
    data['alamat'] = this.alamat;
    return data;
  }
}
