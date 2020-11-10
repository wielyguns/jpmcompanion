import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/model/precisionLocation.dart';
import 'package:jpmcompanion/model/trackingPositionModel.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart' as po;
import 'package:jpmcompanion/routeTransition.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:jpmcompanion/service/shippingOrderService.dart';
import 'package:jpmcompanion/view/homeView.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

class ShippingOrderViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();
  List<DropdownMenuItem> _asalDropdownMenuItem = [];
  String _titleSnap;
  po.Asal _asalData;
  Position _position;
  TextEditingController _deliveryOrder = TextEditingController();
  String _deliveryOrderErrorMessage = '';

  TextEditingController _tanggal = TextEditingController();
  TextEditingController _asal = TextEditingController();
  TextEditingController _tujuan = TextEditingController();
  TextEditingController _nopol = TextEditingController();
  TextEditingController _jumlahUnit = TextEditingController();
  // SETTER
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  GlobalKey<FormState> get formKey => _formKey;
  List<DropdownMenuItem> get asalDropdownMenuItem => _asalDropdownMenuItem;
  TextEditingController get deliveryOrder => _deliveryOrder;
  String get deliveryOrderErrorMessage => _deliveryOrderErrorMessage;
  TextEditingController get tanggal => _tanggal;
  TextEditingController get asal => _asal;
  TextEditingController get tujuan => _tujuan;
  TextEditingController get nopol => _nopol;
  TextEditingController get jumlahUnit => _jumlahUnit;

  String get titleSnap => _titleSnap;
  // FUNCTION
  init(context, po.ShippingOrderData result) async {
    if (result != null) {
      _nopol.text = result.nopol;
    }
    _tanggal.text = DateFormat('d/M/y').format(DateTime.now());
    notifyListeners();
  }

  getOrigin(context) async {
    var result = await Navigator.of(context).pushNamed(listKotaRoute);
    if (result != null) {
      _asalData = result;
      _asal.text = _asalData.nama;
      print(_asalData.nama);
    }
    notifyListeners();
  }

  getDestination(context) async {
    _position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    var result = await Navigator.of(context).pushNamed(
      mapSelectRoute,
      arguments: _position,
    );
    if (result != null) {
      Marker temp = result;
      _position = Position(
        latitude: temp.position.latitude,
        longitude: temp.position.longitude,
      );
      await MainService().geoLocation(_position).then((value) async {
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

  proses(context) async {
    FocusScope.of(context).unfocus();
    print(_formKey.currentState.validate());
    _deliveryOrderErrorMessage = '';
    notifyListeners();
    if (!_formKey.currentState.validate()) {
      return;
    }
    setBusy(true);
    ShippingOrder data = ShippingOrder(
      nomor: _deliveryOrder.text,
      tanggal: _tanggal.text,
      asalId: _asalData.id.toString(),
      latitude: _position.latitude.toString(),
      longitude: _position.longitude.toString(),
      nopol: _nopol.text,
      jumlahUnit: _jumlahUnit.text,
      alamat: _tujuan.text,
    );

    await ShippingOrderService().prosesShippingOrder(data).then(
      (value) async {
        if (value['status'] == 1) {
          messageToast(value['message'], Colors.black);
          Navigator.pushAndRemoveUntil(
            context,
            RouteAnimationDurationFade(
              widget: HomeView(),
            ),
            (route) => false,
          );
        } else {
          _deliveryOrderErrorMessage = (value['errors']['nomor'] != null)
              ? value['errors']['nomor'][0]
              : '';
          notifyListeners();
          await Future.delayed(Duration(milliseconds: 500)).then((value) {
            if (!_formKey.currentState.validate()) {
              return;
            }
          });

          messageToast(value['message'], Colors.red);
        }
      },
    );
    setBusy(false);
    print(_deliveryOrderErrorMessage);
    notifyListeners();
  }
}
