import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:twitter_qr_scanner/twitter_qr_scanner.dart';

import '../const.dart';

class UpdateDoScannerViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  GlobalKey _qrKey = GlobalKey();
  QRViewController _controller;
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
  GlobalKey get qrKey => _qrKey;
  QRViewController get controller => _controller;
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
  init(context, param) async {
    await redirectToLogin(context);
    notifyListeners();
  }

  void onQRViewCreate(QRViewController cont) {
    cont = _controller;
    print('ini $cont');
    _controller.scannedDataStream.listen((scanData) {
      print("QRCode: $scanData");
    });
  }
}
