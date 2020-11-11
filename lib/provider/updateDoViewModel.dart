import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart';
import 'package:jpmcompanion/model/updateDoModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:localstorage/localstorage.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart' as po;

class UpdateDoViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String _titleSnap;
  List<Asal> _feedData = [];
  List<DropdownMenuItem> _trackingTypeDropdown = [];
  List<DropdownMenuItem> _trackingDescriptionDropdown = [];
  List<TrackingType> _trackingType = [];
  List<TrackingDescription> _trackingDescription = [];
  TextEditingController _tanggal = TextEditingController();
  TextEditingController _deskripsi = TextEditingController();
  TextEditingController _kota = TextEditingController();
  po.Asal _kotaData;
  final LocalStorage storage = new LocalStorage('tracking');

  // SETTER
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  TextEditingController get tanggal => _tanggal;
  TextEditingController get deskripsi => _deskripsi;
  TextEditingController get kota => _kota;
  List<DropdownMenuItem> get trackingTypeDropdown => _trackingTypeDropdown;
  List<DropdownMenuItem> get trackingDescriptionDropdown =>
      _trackingDescriptionDropdown;

  String get titleSnap => _titleSnap;
  List<Asal> get feedData => _feedData;
  // FUNCTION
  init(context) async {
    await getTrackingDescription();
    await getTrackingType();
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
              GetKota.fromJson(
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
  }

  getTrackingType() async {
    if (storage.getItem('trackingType') == null) {
      await MainService().getTrackingType().then((value) {
        if (value['status'] == 1) {
          storage.setItem(
            'trackingType',
            GetKota.fromJson(
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
    Navigator.pushNamed(context, updateDoScannerRoute);
  }
}
