import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/precisionLocation.dart';
import 'package:jpmcompanion/model/trackingPositionModel.dart';
import 'package:jpmcompanion/model/purchaseOrderModel.dart' as po;
import 'package:jpmcompanion/service/mainService.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

class PurchaseOrderViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<DropdownMenuItem> _asalDropdownMenuItem = [];
  String _titleSnap;
  TextEditingController _deliveryOrder = TextEditingController();
  TextEditingController _tanggal = TextEditingController();
  TextEditingController _asal = TextEditingController();
  TextEditingController _tujuan = TextEditingController();
  TextEditingController _nopol = TextEditingController();
  TextEditingController _jumlahUnit = TextEditingController();
  // SETTER
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  List<DropdownMenuItem> get asalDropdownMenuItem => _asalDropdownMenuItem;
  TextEditingController get deliveryOrder => _deliveryOrder;
  TextEditingController get tanggal => _tanggal;
  TextEditingController get asal => _asal;
  TextEditingController get tujuan => _tujuan;
  TextEditingController get nopol => _nopol;
  TextEditingController get jumlahUnit => _jumlahUnit;

  String get titleSnap => _titleSnap;
  // FUNCTION
  init(context, TrackingResult result) async {
    if (result != null) {
      _nopol.text = result.nopol;
    }
    _tanggal.text = DateFormat('d/M/y').format(DateTime.now());
    notifyListeners();
  }

  getOrigin(context) async {
    var result = await Navigator.of(context).pushNamed(listKotaRoute);
    if (result != null) {
      po.Asal temp = result;
      _asal.text = temp.nama;
      print(temp.nama);
    }
    notifyListeners();
  }

  getDestination(context) async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    var result = await Navigator.of(context).pushNamed(
      mapSelectRoute,
      arguments: position,
    );
    if (result != null) {
      Marker temp = result;
      position = Position(
        latitude: temp.position.latitude,
        longitude: temp.position.longitude,
      );
      await MainService().geoLocation(position).then((value) async {
        if (value['status'] == 'OK') {
          PrecisionLocation data = PrecisionLocation.fromJson(
            value['results'][0],
          );
          _tujuan.text = "${data.formattedAddress}";
        }
      });
    }
    notifyListeners();
  }

  getNopol(context) async {
    var result = await Navigator.of(context).pushNamed(listNopolRoute);
    po.Nopol temp = po.Nopol.fromJson(result);
    _nopol.text = temp.nopol;
    notifyListeners();
  }

  changeDate(context) async {
    var result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().subtract(
        Duration(days: -30),
      ),
    );
    if (result != null) {
      _tanggal.text = DateFormat('d/M/y').format(result);
    }
  }
}
