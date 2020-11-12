import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:localstorage/localstorage.dart';
import 'package:stacked/stacked.dart';

class ListKotaViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<Asal> _asal;
  String _titleSnap;
  List<Asal> _feedData = [];

  final LocalStorage storage = new LocalStorage('kota');
  // SETTER
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  List<Asal> get asal => _asal;

  String get titleSnap => _titleSnap;
  List<Asal> get feedData => _feedData;
  // FUNCTION
  init(context) async {
    await redirectToLogin(context);
    await getKota(context);
  }

  getKota(context) async {
    _asal = [];
    Map data = {"jenis": "asal"};
    if (storage.getItem('asal') == null) {
      await MainService().getKota(data).then(
        (value) async {
          if (value['status'] == 1) {
            storage.setItem('asal', GetKota.fromJson(value));
            var result = storage.getItem('asal');

            for (var item in result['data']) {
              _asal.add(Asal.fromJson(item));
            }
          } else if (value['status'] == 0) {
            redirectToLogin(context);
          }
        },
      );
    } else {
      var result = storage.getItem('asal');
      for (var item in result['data']) {
        _asal.add(Asal.fromJson(item));
      }
    }

    notifyListeners();
  }

  runFilter(value) async {
    _feedData = [];
    for (Asal item in _asal) {
      if (item.nama.contains(value.toUpperCase())) {
        _feedData.add(item);
      }
    }

    notifyListeners();
  }

  selectedData(context, item) {
    Navigator.of(context).pop(item);
  }
}
