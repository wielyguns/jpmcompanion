import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/main.dart' as main;
import 'package:jpmcompanion/model/PickUpModel.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/model/updateDoModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:jpmcompanion/widget/deliveryOrderInputField.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signature/signature.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart' as po;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PickUpCourierViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _titleSnap;
  String _penerimaValidation = '';
  List<PickUp> _onProgressPickUp = [];
  List<PickUp> _completedPickUp = [];
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
  TextEditingController _alasanCancel = TextEditingController();
  TextEditingController _jumlahMultiDrop = TextEditingController();
  po.Asal _kotaData;
  final LocalStorage storage = new LocalStorage('tracking');
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  final picker = ImagePicker();
  File _image;
  TabController _tabController;
  bool _onProcessLoading = false;
  bool _darken = false;
  SnappingSheetController _snappingSheetController = SnappingSheetController();
  // SETTER
  User get user => _user;
  String get trackingTypeValue => _trackingTypeValue;
  String get penerimaValidation => _penerimaValidation;
  String get trackingDescriptionValue => _trackingDescriptionValue;
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get alasanCancel => _alasanCancel;
  TextEditingController get jumlahMultiDrop => _jumlahMultiDrop;

  List<DropdownMenuItem> get trackingTypeDropdown => _trackingTypeDropdown;
  List<DropdownMenuItem> get jenisBuktiPembayaran => _jenisBuktiPembayaran;
  List<DropdownMenuItem> get trackingDescriptionDropdown =>
      _trackingDescriptionDropdown;
  SignatureController get signatureController => _signatureController;
  TabController get tabController => _tabController;

  String get titleSnap => _titleSnap;
  String get jenisBuktiPembayaranValue => _jenisBuktiPembayaranValue;
  List<PickUp> get onProgressPickUp => _onProgressPickUp;
  List<PickUp> get completedPickUp => _completedPickUp;
  bool get onProcessLoading => _onProcessLoading;
  bool get darken => _darken;
  SnappingSheetController get snappingSheetController =>
      _snappingSheetController;

  File get image => _image;
  // FUNCTION
  init(context, vsync) async {
    await redirectToLogin(context);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('user');
    if (temp != null) {
      _user = User.fromJson(jsonDecode(temp));
    }
    _tabController = TabController(length: 3, vsync: vsync);
    _tabController.addListener(() {
      _darken = false;
      notifyListeners();
    });
    setBusy(true);
    await getTrackingDescription();
    await getTrackingType();
    await getPickUpData();
    setBusy(false);
    notifyListeners();
  }

  getPickUpData() async {
    _onProgressPickUp = [];
    _completedPickUp = [];
    await MainService().getPickUp().then(
      (value) {
        print('INI STATIS ${value['status']}');
        if (value['status'] == 1) {
          for (var item in value['data']) {
            if (item['status'] == 'On Progress') {
              _onProgressPickUp.add(PickUp.fromJson(item));
            } else if (item['status'] == 'Completed') {
              if (_completedPickUp.length < 20) {
                _completedPickUp.add(PickUp.fromJson(item));
              }
            }
          }
        }
      },
    );
    notifyListeners();
  }

  selectedData(context, item) {
    Navigator.of(context).pop(item);
  }

  getImage(context) async {
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

  changeJenisBuktiPembayaran(value) async {
    _jenisBuktiPembayaranValue = value;
    notifyListeners();
  }

  processing(item) async {
    main.onProcessPickUp = item;
    _jumlahMultiDrop.text = main.onProcessPickUp.jumlahTujuan.toString();
    _tabController.animateTo(1);
  }

  refreshWaitingList() async {
    await getPickUpData();
  }

  collapseSnapping() {
    _darken = false;
    _snappingSheetController.snapToPosition(
      SnapPosition(
        positionPixel: 0,
        positionFactor: 0.5,
        snappingCurve: Curves.ease,
        snappingDuration: Duration(milliseconds: 200),
      ),
    );
    notifyListeners();
  }

  cancelPickUp(context) async {
    _darken = true;
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 200)).then((value) {
      _snappingSheetController.snapToPosition(
        SnapPosition(
          positionPixel: 0.5.hp,
          positionFactor: 0.5,
          snappingCurve: Curves.ease,
          snappingDuration: Duration(milliseconds: 200),
        ),
      );
    });
  }

  toWaitingListTab() {
    _tabController.animateTo(0);
  }

  permissionDialog(context) {
    return showDialog(
      context: context,
      child: new AlertDialog(
        title: Container(
          child: Column(
            children: [
              new Text(
                "Anda yakin ingin menyelesaikan orderan ini?",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (main.onProcessPickUp.tujuan == null)
                Container(
                  child: DeliveryOrderInputField(
                    title: 'Jumlah Multi Drop',
                    keyboard: TextInputType.number,
                    controller: _jumlahMultiDrop,
                    onTap: () {
                      return false;
                    },
                  ),
                )
            ],
          ),
        ),
        actions: [
          RaisedButton(
            focusElevation: 0,
            hoverElevation: 0,
            highlightColor: Colors.transparent,
            splashColor: Colors.blue[50],
            padding: EdgeInsets.zero,
            color: Colors.transparent,
            elevation: 0,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 0.015.hp,
                horizontal: 0.04.wp,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Color(
                    hexStringToHexInt('#126afc'),
                  ),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'TIDAK',
                style: TextStyle(
                  color: Color(
                    hexStringToHexInt('#126afc'),
                  ),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          RaisedButton(
            focusElevation: 0,
            hoverElevation: 0,
            highlightColor: Colors.transparent,
            splashColor: Colors.blue[50],
            padding: EdgeInsets.zero,
            color: Colors.transparent,
            elevation: 0,
            onPressed: () async {
              Navigator.pop(context);
              await submitReceivedPickup(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 0.015.hp,
                horizontal: 0.04.wp,
              ),
              decoration: BoxDecoration(
                color: Color(
                  hexStringToHexInt('#126afc'),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'YA',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onImageButtonPressed(context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Sumber Gambar'),
          content: Container(
            height: 120,
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onCameraSelected(context, 'camera');
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              FontAwesomeIcons.camera,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    color: Colors.cyan,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onCameraSelected(context, 'gallery');
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.camera,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    color: Colors.cyan,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  onCameraSelected(context, param) async {
    _image = null;
    if (param == 'camera') {
      var result = await Navigator.of(context).pushNamed(camera);
      if (result != null) {
        _image = result;
      }
    } else {
      var pickedFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        imageQuality: 10,
      );

      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    }
    notifyListeners();
  }

  submitReceivedPickup(context) async {
    var foto;
    setBusy(true);
    if (_image != null) {
      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/foto.jpg').create();
      file.writeAsBytesSync(_image.readAsBytesSync());
      foto = file.path;
    }

    _image = null;

    if (foto == null) {
      setBusy(false);
      messageToast('Bukti pickup harus diisi', Colors.red);
      return false;
    }

    Map data = {
      "id": main.onProcessPickUp.id.toString(),
      "jumlah_tujuan": _jumlahMultiDrop.text,
      "image": foto,
    };

    await MainService().submitReceivedPickUp(data).then((value) async {
      if (value['status'] == 1) {
        main.onProcessPickUp = null;
        await refreshWaitingList();
        messageToast(value['message'], Colors.black54);
      } else {
        messageToast(value['message'], Colors.black54);
      }
    });
    setBusy(false);
    notifyListeners();
  }

  submitCancelPickUp(context) async {
    setBusy(true);
    Map data = {
      "id": main.onProcessPickUp.id.toString(),
      'alasan_cancel': _alasanCancel.text,
    };
    await MainService().submitCancelPickUp(data).then((value) async {
      if (value['status'] == 1) {
        main.onProcessPickUp = null;
        await refreshWaitingList();
        messageToast(value['message'], Colors.black54);
      } else {
        messageToast(value['message'], Colors.black54);
      }
    });
    setBusy(false);
    notifyListeners();
  }
}
