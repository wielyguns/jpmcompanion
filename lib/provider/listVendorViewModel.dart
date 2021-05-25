import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/VendorModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:localstorage/localstorage.dart';
import 'package:stacked/stacked.dart';

class ListVendorViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<Vendor> _vendor;
  String _titleSnap;
  List<Vendor> _feedData = [];

  final LocalStorage storage = new LocalStorage('kota');
  // SETTER
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  List<Vendor> get vendor => _vendor;

  String get titleSnap => _titleSnap;
  List<Vendor> get feedData => _feedData;
  // FUNCTION
  init(context) async {
    await redirectToLogin(context);
    await getVendor(context);
  }

  getVendor(context) async {
    _vendor = [];
    await MainService().getVendor().then(
      (value) async {
        if (value['status'] == 1) {
          for (var item in value['data']) {
            _vendor.add(Vendor.fromJson(item));
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
    for (Vendor item in _vendor) {
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
