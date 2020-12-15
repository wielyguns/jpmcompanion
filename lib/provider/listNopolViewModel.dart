import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:localstorage/localstorage.dart';
import 'package:stacked/stacked.dart';

class ListNopolViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<Nopol> _nopol;
  String _titleSnap;
  List<Nopol> _feedData = [];

  final LocalStorage storage = new LocalStorage('nopol');
  // SETTER
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  List<Nopol> get nopol => _nopol;

  String get titleSnap => _titleSnap;
  List<Nopol> get feedData => _feedData;
  // FUNCTION
  init(context) async {
    await redirectToLogin(context);
    await getNopol(context);
  }

  getNopol(context) async {
    _nopol = [];
    await MainService().getNopol().then(
      (value) async {
        if (value['status'] == 1) {
          for (var item in value['data']) {
            _nopol.add(Nopol.fromJson(item));
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
    for (Nopol item in _nopol) {
      if (item.nopol.contains(value.toUpperCase())) {
        _feedData.add(item);
      }
    }

    notifyListeners();
  }

  selectedData(context, item) {
    Navigator.of(context).pop(item.toJson());
  }
}
