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

class User {
  int id;
  String nama;
  String username;
  String email;
  dynamic emailVerifiedAt;
  dynamic deletedAt;
  String createdAt;
  String updatedAt;
  dynamic idAgen;
  int jabatanId;
  String image;
  String status;
  String kodeCabang;
  dynamic kodeAgen;
  String background;
  String urlImage;
  String urlBackground;
  Jabatan jabatan;

  User(
      {this.id,
      this.nama,
      this.username,
      this.email,
      this.emailVerifiedAt,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.idAgen,
      this.jabatanId,
      this.image,
      this.status,
      this.kodeCabang,
      this.kodeAgen,
      this.background,
      this.urlImage,
      this.urlBackground,
      this.jabatan});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    username = json['username'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    idAgen = json['id_agen'];
    jabatanId = json['jabatan_id'];
    image = json['image'];
    status = json['status'];
    kodeCabang = json['kode_cabang'];
    kodeAgen = json['kode_agen'];
    background = json['background'];
    urlImage = json['urlImage'];
    urlBackground = json['urlBackground'];
    jabatan =
        json['jabatan'] != null ? new Jabatan.fromJson(json['jabatan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['username'] = this.username;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id_agen'] = this.idAgen;
    data['jabatan_id'] = this.jabatanId;
    data['image'] = this.image;
    data['status'] = this.status;
    data['kode_cabang'] = this.kodeCabang;
    data['kode_agen'] = this.kodeAgen;
    data['background'] = this.background;
    data['urlImage'] = this.urlImage;
    data['urlBackground'] = this.urlBackground;
    if (this.jabatan != null) {
      data['jabatan'] = this.jabatan.toJson();
    }
    return data;
  }
}

class Jabatan {
  int id;
  String nama;
  String keterangan;
  String status;
  dynamic deletedAt;
  String createdAt;
  String updatedAt;

  Jabatan(
      {this.id,
      this.nama,
      this.keterangan,
      this.status,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Jabatan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    keterangan = json['keterangan'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['keterangan'] = this.keterangan;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ReceivedNotification {
  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}
