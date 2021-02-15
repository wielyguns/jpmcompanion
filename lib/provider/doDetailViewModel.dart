import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/deliveryOrderModel.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

class DoDetailViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();
  List<DropdownMenuItem> _asalDropdownMenuItem = [];
  String _titleSnap;
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
  init(context, DeliveryOrder result) async {
    await redirectToLogin(context);
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
