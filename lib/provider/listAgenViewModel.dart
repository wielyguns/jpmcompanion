import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/AgenModel.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:localstorage/localstorage.dart';
import 'package:stacked/stacked.dart';

class ListAgenViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<Agen> _agen;
  String _titleSnap;
  List<Agen> _feedData = [];

  final LocalStorage storage = new LocalStorage('kota');
  // SETTER
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  List<Agen> get asal => _agen;

  String get titleSnap => _titleSnap;
  List<Agen> get feedData => _feedData;
  // FUNCTION
  init(context) async {
    await redirectToLogin(context);
    await getAgen(context);
  }

  getAgen(context) async {
    _agen = [];
    await MainService().getAgen().then(
      (value) async {
        if (value['status'] == 1) {
          for (var item in value['data']) {
            _agen.add(Agen.fromJson(item));
          }
        } else if (value['status'] == 0) {
          redirectToLogin(context);
        }
      },
    );
    notifyListeners();
  }

  runFilter(value) async {
    _feedData = [];
    for (Agen item in _agen) {
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
