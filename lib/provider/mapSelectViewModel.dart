import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/locationPrediction.dart';
import 'package:jpmcompanion/model/placeDetail.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:jpmcompanion/widget/debouncer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:stacked/stacked.dart';

class MapSelectViewModel extends BaseViewModel {
  // SETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  SnappingSheetController snappingSheetController = SnappingSheetController();
  TextEditingController _search = TextEditingController(text: "");
  List<LocationPrediction> _locationPrediction = [];
  List<LocationPrediction> _recentPrediction = [];
  List _item = [];
  Position _position = Position();
  bool _isFocused = false;
  bool _isChoosedFromMap = false;
  double _top = 0;
  double _bottom = 0;
  PlaceDetail _placeDetail = PlaceDetail();
  final debouncer = Debouncer(milliseconds: 100);
  GoogleMapController _controller;
  // GETTER
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  List get item => _item;
  List<Marker> _marker = [];
  Position get position => _position;
  bool get isFocused => _isFocused;
  PlaceDetail get placeDetail => _placeDetail;
  TextEditingController get search => _search;
  List<LocationPrediction> get locationPrediction => _locationPrediction;
  List<LocationPrediction> get recentPrediction => _recentPrediction;
  List<Marker> get marker => _marker;
  GoogleMapController get controller => _controller;
  double get top => _top;
  double get bottom => _bottom;
  init(context) async {
    await redirectToLogin(context);
    await getRecentPrediction();
  }

  initController(controller) {
    _controller = controller;
    notifyListeners();
  }

  getRecentPrediction() async {
    _recentPrediction = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('recentLocation') != null) {
      var result = jsonDecode(prefs.getString('recentLocation'));
      result.forEach((d) {
        _recentPrediction.add(LocationPrediction.fromJson(d));
      });
    }

    notifyListeners();
  }

  runFilter(value) {
    debouncer.run(() async {
      _locationPrediction = [];
      var result = await MainService().getLocation(value);
      if (result['status'] == 'OK') {
        for (var item in result['predictions']) {
          _locationPrediction.add(LocationPrediction.fromJson(item));
        }
      }
      notifyListeners();
    });
  }

  openSnap() {
    ScreenUtil.init(_scaffoldKey.currentContext);
    _isFocused = true;
    snappingSheetController
        .snapToPosition(SnapPosition(positionPixel: 1.hp - kToolbarHeight * 2));
    notifyListeners();
  }

  closeSnap() {
    if (!_isFocused) {
      Navigator.of(_scaffoldKey.currentContext).pop();
    }
    if (_isFocused) {
      snappingSheetController.snapToPosition(SnapPosition(positionPixel: 0));
      _isFocused = false;
    }

    notifyListeners();
  }

  clearFilter() async {
    _search = TextEditingController(text: '');
    notifyListeners();
  }

  selectLocation(LocationPrediction value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List temp = [];
    if (prefs.getString('recentLocation') == null) {
      temp.add(value.toJson());
      prefs.setString('recentLocation', '${jsonEncode(temp)}');
    } else {
      var result = jsonDecode(prefs.getString('recentLocation'));

      result.forEach((d) {
        temp.add(d);
      });

      bool validation = true;
      for (var item in temp) {
        if (item['description'] == value.description) {
          validation = false;
        }
      }

      if (validation) {
        if (temp.length > 6) {
          temp.remove(temp[0]);
        }
        temp.add(value.toJson());
      }
      prefs.setString('recentLocation', '${jsonEncode(temp)}');
    }

    await getRecentPrediction();
    await openLocation(value);
    notifyListeners();
  }

  clearRecent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('recentLocation');
    await getRecentPrediction();
    notifyListeners();
  }

  openLocation(LocationPrediction value) async {
    closeSnap();
    _marker = [];
    _isChoosedFromMap = false;
    _search.text = value.description;
    var result = await MainService().getLocationDetail(value);
    if (result['status'] == 'OK') {
      _placeDetail = PlaceDetail.fromJson(result['result']);
      LatLng _position = LatLng(
        _placeDetail.geometry.location.lat,
        _placeDetail.geometry.location.lng,
      );
      _marker.add(
        Marker(
          position: _position,
          markerId: MarkerId("1"),
        ),
      );
      _controller.animateCamera(
        CameraUpdate.newLatLng(_position),
      );
    }

    notifyListeners();
  }

  onCameraMove(position) {
    ScreenUtil.init(_scaffoldKey.currentContext);
    _top = -0.2.hp;
    _bottom = -0.2.hp;
    debouncer.run(() {
      _top = 0;
      _bottom = 0;
      notifyListeners();
    });

    if (_isChoosedFromMap) {
      if (marker.length > 0) {
        Marker mark = marker[0];
        Marker updatedMarker = mark.copyWith(
          positionParam: position.target,
        );

        marker[0] = updatedMarker;
      }
    }
    notifyListeners();
  }

  chooseFromMap() async {
    _isChoosedFromMap = true;
    closeSnap();
    notifyListeners();
  }

  chooseLocation() {
    if (_marker.length != 0) {
      Navigator.of(_scaffoldKey.currentContext).pop(_marker[0]);
    } else {
      messageToast('Belum memilih lokasi', textBlack);
    }
  }
}
