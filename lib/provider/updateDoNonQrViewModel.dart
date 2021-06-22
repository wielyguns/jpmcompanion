import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/AgenModel.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/model/VendorModel.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart';
import 'package:jpmcompanion/model/updateDoModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signature/signature.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart' as po;
import 'package:jpmcompanion/model/courierModel.dart' as co;

class UpdateDoNonQrViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _titleSnap;
  String _penerimaValidation = '';
  List<Asal> _feedData = [];
  List<DropdownMenuItem> _trackingTypeDropdown = [];
  String _trackingTypeValue;
  String _trackingDescriptionValue;
  String _hubValue;
  String _jenisBuktiPembayaranValue = 'foto';
  User _user = User();
  co.Courier _courierData = co.Courier();
  Kota _kotaData = Kota();
  Agen _agenData = Agen();
  List<DropdownMenuItem> _trackingDescriptionDropdown = [];
  List<DropdownMenuItem> _hubDropdown = [];
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
  Vendor _vendorData;

  List<TrackingType> _trackingType = [];
  List<TrackingDescription> _trackingDescription = [];
  TextEditingController _tanggal = TextEditingController();
  TextEditingController _deskripsi = TextEditingController();
  TextEditingController _kota = TextEditingController();
  TextEditingController _nopol = TextEditingController();
  TextEditingController _courier = TextEditingController();
  TextEditingController _penerima = TextEditingController();
  TextEditingController _nomor = TextEditingController();
  TextEditingController _agen = TextEditingController();
  TextEditingController _vendor = TextEditingController();
  final LocalStorage storage = new LocalStorage('tracking');
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  final picker = ImagePicker();
  File _image;
  // SETTER
  User get user => _user;
  String get trackingTypeValue => _trackingTypeValue;
  String get penerimaValidation => _penerimaValidation;
  String get trackingDescriptionValue => _trackingDescriptionValue;
  String get hubValue => _hubValue;
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get tanggal => _tanggal;
  TextEditingController get deskripsi => _deskripsi;
  TextEditingController get kota => _kota;
  TextEditingController get nopol => _nopol;
  TextEditingController get courier => _courier;
  TextEditingController get penerima => _penerima;
  TextEditingController get nomor => _nomor;
  TextEditingController get agen => _agen;
  TextEditingController get vendor => _vendor;
  List<DropdownMenuItem> get trackingTypeDropdown => _trackingTypeDropdown;
  List<DropdownMenuItem> get hubDropdown => _hubDropdown;
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
    await redirectToLogin(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('user');
    if (temp != null) {
      _user = User.fromJson(jsonDecode(temp));

      if (_user.courier != null) {
        _courierData = co.Courier(
          nama: _user.courier.nama,
          kodeCabang: _user.courier.kodeCabang,
          kode: _user.courier.kode,
          id: _user.courier.id,
        );
        _courier.text = '${_user.courier.kode} | ${_user.courier.nama}';
        print(_courierData.toJson());
      }
    }

    setBusy(true);
    await getTrackingDescription();
    await getTrackingType();
    await getHub();
    setBusy(false);
    notifyListeners();
  }

  selectedData(context, item) {
    Navigator.of(context).pop(item);
  }

  getImage(context) async {
    // final pickedFile = await picker.getImage(
    //   source: ImageSource.camera,
    //   maxWidth: double.infinity,
    //   maxHeight: double.infinity,
    //   imageQuality: 10,
    // );
    // if (pickedFile != null) {
    //   _image = File(pickedFile.path);
    // } else {
    //   print('No image selected.');
    // }
    var result = await Navigator.of(context).pushNamed(camera);
    if (result != null) {
      _image = result;
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

  getHub() async {
    _hubDropdown = [];
    await MainService().getHub().then(
      (value) {
        print(value);
        if (value['status'] == 1) {
          for (var item in value['data']) {
            _hubDropdown.add(
              DropdownMenuItem<String>(
                child: Text('${item['hub']} (${item['nama']})'),
                value: '${item['id']}',
              ),
            );
          }
        }
      },
    );
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
      if (_user.jabatan.id == 2 || _user.jabatan.id == 3) {
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
    }
    notifyListeners();
  }

  processData(context) async {
    if (_trackingTypeValue == '' ||
        _trackingDescriptionValue == '' ||
        _trackingTypeValue == null ||
        _trackingDescriptionValue == null) {
      messageToast('Semua data harus diisi', Colors.red);
      return;
    }
    setBusy(true);
    Map<String, dynamic> data = {
      "nomor": _nomor.text,
      "type": _trackingTypeValue,
      "deskripsi": _trackingDescriptionValue,
      "courier_id": null,
      "kota_id": _kotaData.id.toString(),
      "kode_agen": null,
      "kode_vendor": null,
      "nopol": _nopol.text,
      "hub": _hubValue,
    };

    if (_vendorData != null) {
      data['kode_vendor'] = _vendorData.kode.toString();
    }

    if (_agenData != null) {
      data['kode_agen'] = _agenData.kode.toString();
    }

    if (_courierData != null) {
      data['courier_id'] = _courierData.id.toString();
    }

    await MainService().updateTracking(data).then((value) {
      if (value['status'] == 1) {
        messageToast(value['message'], Colors.black);
      } else {
        messageToast(value['message'], Colors.red);
      }
    });
    setBusy(false);
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

  changeHub(value) async {
    _hubValue = value;
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

  getCourier(context) async {
    var result = await Navigator.of(context).pushNamed(listCourierRoute);
    if (result != null) {
      _courierData = co.Courier.fromJson(result);
      _courier.text = '${_courierData.kode} | ${_courierData.nama}';
    }

    notifyListeners();
  }

  getKota(context) async {
    var result = await Navigator.of(context).pushNamed(listKotaRoute);
    if (result != null) {
      _kotaData = result;
      _kota.text = ' ${_kotaData.nama}';
    }

    notifyListeners();
  }

  getAgen(context) async {
    var result = await Navigator.of(context).pushNamed(listAgenRoute);
    if (result != null) {
      _agenData = result;
      _agen.text = ' ${_agenData.nama}';
    }

    notifyListeners();
  }

  getVendor(context) async {
    var result = await Navigator.of(context).pushNamed(listVendorRoute);
    if (result != null) {
      _vendorData = result;
      _vendor.text = ' ${_vendorData.nama}';
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
      } else {
        messageToast(value['message'], Colors.red);
      }
    }, onError: (e) {
      print(e);
      messageToast('$e', Colors.red);
    });
    setBusy(false);
  }

  changeJenisBuktiPembayaran(value) async {
    _jenisBuktiPembayaranValue = value;
    notifyListeners();
  }
}
