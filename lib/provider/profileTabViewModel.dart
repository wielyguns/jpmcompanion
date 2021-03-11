import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/model/homeModel.dart';
import 'package:jpmcompanion/routeTransition.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:jpmcompanion/view/loginView.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../const.dart';

class ProfileTabViewModel extends BaseViewModel {
  // SETTER
  List<FlSpot> _pendapatanSpots = [
    FlSpot(0, 0),
  ];

  List<FlSpot> _deliveryOrderSpots = [
    FlSpot(0, 0),
  ];
  User _user;
  DataDashboard _dataDashboard;
  List<String> _spotsName = [];
  final picker = ImagePicker();
  File _image;
  // GETTER
  List<FlSpot> get pendapatanSpots => _pendapatanSpots;
  List<FlSpot> get deliveryOrderSpots => _deliveryOrderSpots;
  DataDashboard get dataDashboard => _dataDashboard;
  User get user => _user;
  List<String> get spotsName => _spotsName;
  init(context) async {
    setBusy(true);
    await redirectToLogin(context);
    await getDataUser();
    setBusy(false);
    notifyListeners();
  }

  getDataUser() async {
    await MainService().user().then((value) async {
      if (value['status'] == 1) {
        _user = User.fromJson(value['data']);
      } else if (value['status'] == 0) {
        // await redirectToLogin(context);
      }
    });
    notifyListeners();
  }

  logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('id');
    prefs.remove('user');
    prefs.remove('shortcut1');
    prefs.remove('shortcut2');
    prefs.remove('shortcut3');
    prefs.remove('shortcut4');
    Navigator.pushAndRemoveUntil(
      context,
      RouteAnimationDurationFade(
        widget: LoginView(),
      ),
      (route) => false,
    );
  }

  onRefresh() async {
    setBusy(true);
    await getDataUser();
    setBusy(false);
    notifyListeners();
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
      var pickedFile = await picker.getImage(
        source: ImageSource.gallery,
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        imageQuality: 10,
      );

      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    }

    if (_image != null) {
      var foto;
      setBusy(true);
      if (_image != null) {
        final tempDir = await getTemporaryDirectory();
        final file = await new File('${tempDir.path}/foto.jpg').create();
        file.writeAsBytesSync(_image.readAsBytesSync());
        foto = file.path;
      }

      Map data = {
        "image": foto,
      };
      await MainService().changeUserPicture(data).then((value) {
        if (value['status'] == 1) {
          onRefresh();
          messageToast(value['message'], Colors.black54);
        } else {
          messageToast(value['message'], Colors.black54);
        }
      });
      notifyListeners();
    }
  }
}
