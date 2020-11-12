import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart';
import 'package:jpmcompanion/model/updateDoModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart' as po;

class UpdateDoViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _titleSnap;
  List<Asal> _feedData = [];
  List<DropdownMenuItem> _trackingTypeDropdown = [];
  String _trackingTypeValue;
  String _trackingDescriptionValue;
  User _user = User();
  List<DropdownMenuItem> _trackingDescriptionDropdown = [];
  List<TrackingType> _trackingType = [];
  List<TrackingDescription> _trackingDescription = [];
  TextEditingController _tanggal = TextEditingController();
  TextEditingController _deskripsi = TextEditingController();
  TextEditingController _kota = TextEditingController();
  TextEditingController _nopol = TextEditingController();
  po.Asal _kotaData;
  final LocalStorage storage = new LocalStorage('tracking');

  // SETTER
  User get user => _user;
  String get trackingTypeValue => _trackingTypeValue;
  String get trackingDescriptionValue => _trackingDescriptionValue;
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get tanggal => _tanggal;
  TextEditingController get deskripsi => _deskripsi;
  TextEditingController get kota => _kota;
  TextEditingController get nopol => _nopol;
  List<DropdownMenuItem> get trackingTypeDropdown => _trackingTypeDropdown;
  List<DropdownMenuItem> get trackingDescriptionDropdown =>
      _trackingDescriptionDropdown;

  String get titleSnap => _titleSnap;
  List<Asal> get feedData => _feedData;
  // FUNCTION
  init(context) async {
    redirectToLogin(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('user');
    _user = User.fromJson(jsonDecode(temp));
    setBusy(true);
    await getTrackingDescription();
    await getTrackingType();
    setBusy(false);
    notifyListeners();
  }

  selectedData(context, item) {
    Navigator.of(context).pop(item);
  }

  getTrackingDescription() async {
    if (storage.getItem('trackingDescription') == null) {
      await MainService().getTrackingDescription().then(
        (value) {
          if (value['status'] == 1) {
            storage.setItem(
              'trackingDescription',
              TrackingDescription.fromJson(
                value,
              ),
            );

            for (var item in value['data']) {
              _trackingDescription.add(TrackingDescription.fromJson(item));
            }
          }
        },
      );
    } else {
      var result = storage.getItem('trackingDescription');
      for (var item in result['data']) {
        _trackingDescription.add(TrackingDescription.fromJson(item));
      }
    }
    notifyListeners();
  }

  getTrackingType() async {
    await storage.clear();
    if (storage.getItem('trackingType') == null) {
      await MainService().getTrackingType().then((value) {
        if (value['status'] == 1) {
          storage.setItem(
            'trackingType',
            TrackingType.fromJson(
              value,
            ),
          );

          for (var item in value['data']) {
            _trackingType.add(TrackingType.fromJson(item));
          }
        }
      });
    } else {
      var result = storage.getItem('trackingType');
      for (var item in result['data']) {
        _trackingType.add(TrackingType.fromJson(item));
      }
    }

    for (var item in _trackingType) {
      print(_user.kodeAgen);
      if (_user.kodeAgen != null) {
        if (item.id == 1) {
          _trackingTypeDropdown.add(
            DropdownMenuItem<String>(
              child: Text('${item.deskripsi}'),
              value: '${item.id}',
            ),
          );
        }
      } else {
        _trackingTypeDropdown.add(
          DropdownMenuItem<String>(
            child: Text('${item.deskripsi}'),
            value: '${item.id}',
          ),
        );
      }
    }

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

  getOrigin(context) async {
    var result = await Navigator.of(context).pushNamed(listKotaRoute);
    if (result != null) {
      _kotaData = result;
      _kota.text = _kotaData.nama;
      print(_kotaData.nama);
    }
    notifyListeners();
  }

  openQrCode(context) async {
    if (_trackingTypeValue == '' ||
        _trackingDescriptionValue == '' ||
        _trackingTypeValue == null ||
        _trackingDescriptionValue == null) {
      messageToast('Semua data harus diisi', Colors.red);
      return;
    }

    Map<String, dynamic> data = {
      "type": _trackingTypeValue,
      "description": _trackingDescriptionValue,
      "nopol": _nopol.text,
    };
    Navigator.pushNamed(context, updateDoScannerRoute, arguments: data);
  }

  changeType(value) async {
    _trackingTypeValue = value;
    _trackingDescriptionValue = null;
    _trackingDescriptionDropdown = [];
    for (var item in _trackingDescription) {
      if ('${item.trackingTypeId}' == '$value') {
        _trackingDescriptionDropdown.add(
          DropdownMenuItem<String>(
            child: Text('${item.deskripsi}'),
            value: '${item.id}',
          ),
        );
      }
    }
    notifyListeners();
  }

  changeDescription(value) async {
    _trackingDescriptionValue = value;
    notifyListeners();
  }

  getNopol(context) async {
    var result = await Navigator.of(context).pushNamed(listNopolRoute);
    if (result != null) {
      po.Nopol temp = po.Nopol.fromJson(result);
      _nopol.text = temp.nopol;
    }

    notifyListeners();
  }
}
