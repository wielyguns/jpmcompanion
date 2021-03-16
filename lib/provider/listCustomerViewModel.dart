import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/deliveryOrderModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:jpmcompanion/widget/debouncer.dart';
import 'package:localstorage/localstorage.dart';
import 'package:stacked/stacked.dart';

class ListCustomerViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String _titleSnap;
  List<Customer> _feedData = [];
  final _debouncer = Debouncer(milliseconds: 500);

  final LocalStorage storage = new LocalStorage('kota');
  // SETTER
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  String get titleSnap => _titleSnap;
  List<Customer> get feedData => _feedData;
  // FUNCTION
  init(context) async {
    await redirectToLogin(context);
    await getCustomer(context, '');
  }

  getCustomer(context, value) async {
    _feedData = [];
    await MainService().getCustomer(value).then(
      (value) async {
        if (value['status'] == 1) {
          for (var item in value['data']) {
            _feedData.add(Customer.fromJson(item));
          }
        } else if (value['status'] == 0) {
          redirectToLogin(context);
        }
      },
    );

    notifyListeners();
  }

  selectedData(context, item) {
    Navigator.of(context).pop(item);
  }

  runFilter(value) async {
    setBusy(true);
    _debouncer.run(() async {
      await getCustomer(_scaffoldKey.currentContext, value);
      setBusy(false);
      notifyListeners();
    });
  }
}
