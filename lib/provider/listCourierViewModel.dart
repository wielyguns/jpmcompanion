import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/courierModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:localstorage/localstorage.dart';
import 'package:stacked/stacked.dart';

class ListCourierViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<Courier> _courier;
  String _titleSnap;
  List<Courier> _feedData = [];

  final LocalStorage storage = new LocalStorage('courier');
  // SETTER
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  List<Courier> get courier => _courier;

  String get titleSnap => _titleSnap;
  List<Courier> get feedData => _feedData;
  // FUNCTION
  init(context) async {
    await redirectToLogin(context);
    await getCourier(context);
  }

  getCourier(context) async {
    _courier = [];
    await MainService().getCourier().then(
      (value) async {
        if (value['status'] == 1) {
          for (var item in value['data']) {
            _courier.add(Courier.fromJson(item));
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
    for (Courier item in _courier) {
      if (item.nama.contains(value.toUpperCase())) {
        _feedData.add(item);
      }
    }

    notifyListeners();
  }

  selectedData(context, item) {
    Navigator.of(context).pop(item.toJson());
  }
}
