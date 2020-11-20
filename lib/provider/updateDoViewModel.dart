import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart';
import 'package:jpmcompanion/model/updateDoModel.dart';
import 'package:jpmcompanion/routeTransition.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:jpmcompanion/view/homeView.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signature/signature.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart' as po;

class UpdateDoViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _titleSnap;
  String _penerimaValidation = '';
  List<Asal> _feedData = [];
  List<DropdownMenuItem> _trackingTypeDropdown = [];
  String _trackingTypeValue;
  String _trackingDescriptionValue;
  String _jenisBuktiPembayaranValue = 'foto';
  User _user = User();
  List<DropdownMenuItem> _trackingDescriptionDropdown = [];
  List<DropdownMenuItem> _jenisBuktiPembayaran = [
    DropdownMenuItem<String>(
      child: Text('Foto'),
      value: 'foto',
    ),
    DropdownMenuItem<String>(
      child: Text('Tanda tangan'),
      value: 'tanda_tangan',
    ),
  ];
  List<TrackingType> _trackingType = [];
  List<TrackingDescription> _trackingDescription = [];
  TextEditingController _tanggal = TextEditingController();
  TextEditingController _deskripsi = TextEditingController();
  TextEditingController _kota = TextEditingController();
  TextEditingController _nopol = TextEditingController();
  TextEditingController _penerima = TextEditingController();
  TextEditingController _nomor = TextEditingController();
  po.Asal _kotaData;
  final LocalStorage storage = new LocalStorage('tracking');
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  File _image;
  final picker = ImagePicker();
  // SETTER
  User get user => _user;
  String get trackingTypeValue => _trackingTypeValue;
  String get penerimaValidation => _penerimaValidation;
  String get trackingDescriptionValue => _trackingDescriptionValue;
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get tanggal => _tanggal;
  TextEditingController get deskripsi => _deskripsi;
  TextEditingController get kota => _kota;
  TextEditingController get nopol => _nopol;
  TextEditingController get penerima => _penerima;
  TextEditingController get nomor => _nomor;
  List<DropdownMenuItem> get trackingTypeDropdown => _trackingTypeDropdown;
  List<DropdownMenuItem> get jenisBuktiPembayaran => _jenisBuktiPembayaran;
  List<DropdownMenuItem> get trackingDescriptionDropdown =>
      _trackingDescriptionDropdown;
  SignatureController get signatureController => _signatureController;

  String get titleSnap => _titleSnap;
  String get jenisBuktiPembayaranValue => _jenisBuktiPembayaranValue;
  List<Asal> get feedData => _feedData;
  File get image => _image;
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

  getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: double.infinity,
      maxHeight: double.infinity,
      imageQuality: 10,
    );

    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    notifyListeners();
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
      if (_user.jabatan.id == 2) {
        if (item.id == 1 || item.id == 4 || item.id == 5) {
          _trackingTypeDropdown.add(
            DropdownMenuItem<String>(
              child: Text('${item.deskripsi}'),
              value: '${item.id}',
            ),
          );
        }
      } else if (_user.jabatan.id == 6) {
        if (item.id == 2 || item.id == 3) {
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
      "deskripsi": _trackingDescriptionValue,
      "nopol": _nopol.text,
    };
    Navigator.pushNamed(context, updateDoScannerRoute, arguments: data);
  }

  searchNopol(context) async {
    Map<String, dynamic> data = {
      "type": _trackingTypeValue,
      "deskripsi": _trackingDescriptionValue,
      "callback": 'true',
    };

    var result = await Navigator.pushNamed(
      context,
      updateDoScannerRoute,
      arguments: data,
    );

    _nomor.text = result;
    notifyListeners();
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

  delivered(context) async {
    setBusy(true);
    Uint8List temp = await _signatureController.toPngBytes();
    var signature;
    var foto;
    if (temp != null) {
      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/signature.jpg').create();
      file.writeAsBytesSync(temp);
      signature = file.path;
    }

    if (_image != null) {
      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/foto.jpg').create();
      file.writeAsBytesSync(_image.readAsBytesSync());
      foto = file.path;
    }

    Map<String, dynamic> data = {
      "type": _trackingTypeValue,
      "deskripsi": _trackingDescriptionValue,
      "penerima": _penerima.text,
      "signature": signature,
      "foto": foto,
      "nomor": _nomor.text,
    };
    // print(file.path);
    await MainService().processDelivered(data).then((value) {
      if (value['status'] == 1) {
        messageToast(value['message'], Colors.black);
        Navigator.pushAndRemoveUntil(
          context,
          RouteAnimationDurationFade(
            widget: HomeView(),
          ),
          (route) => false,
        );
      } else {
        messageToast(value['message'], Colors.red);
      }
    });
    setBusy(false);
  }

  changeJenisBuktiPembayaran(value) async {
    _jenisBuktiPembayaranValue = value;
    notifyListeners();
  }
}
