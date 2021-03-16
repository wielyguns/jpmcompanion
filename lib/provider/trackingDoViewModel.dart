import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/deliveryOrderModel.dart';
import 'package:jpmcompanion/model/trackingDoModel.dart' as track;
import 'package:jpmcompanion/service/mainService.dart';
import 'package:photo_view/photo_view.dart';
import 'package:stacked/stacked.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TrackingDoViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();
  List<DropdownMenuItem> _asalDropdownMenuItem = [];
  String _titleSnap;
  track.Tracking _tracking;
  String _deliveryOrderErrorMessage = '';
  DeliveryOrder _deliveryOrder;
  TextEditingController _tanggal = TextEditingController();
  TextEditingController _asal = TextEditingController();
  TextEditingController _tujuan = TextEditingController();
  TextEditingController _nopol = TextEditingController();
  TextEditingController _jumlahUnit = TextEditingController();
  // SETTER
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  GlobalKey<FormState> get formKey => _formKey;
  List<DropdownMenuItem> get asalDropdownMenuItem => _asalDropdownMenuItem;
  String get deliveryOrderErrorMessage => _deliveryOrderErrorMessage;
  TextEditingController get tanggal => _tanggal;
  TextEditingController get asal => _asal;
  TextEditingController get tujuan => _tujuan;
  TextEditingController get nopol => _nopol;
  TextEditingController get jumlahUnit => _jumlahUnit;
  track.Tracking get tracking => _tracking;

  String get titleSnap => _titleSnap;
  // FUNCTION
  init(context, DeliveryOrder param) async {
    setBusy(true);
    _deliveryOrder = param;
    redirectToLogin(context);
    await getTracking();
    setBusy(false);
    notifyListeners();
  }

  getTracking() async {
    await MainService().getTracking(_deliveryOrder.nomor).then((value) {
      if (value['status'] == 1) {
        if (value['data'] != null) {
          _tracking = track.Tracking.fromJson(value['data']);
        }
      }
    });
    notifyListeners();
  }

  completeTracking(context) {
    return IndicatorStyle(
      width: 30,
      height: 30,
      color: purpleTheme,
      iconStyle: IconStyle(
        color: Colors.white,
        iconData: Icons.circle,
        fontSize: 50.ssp,
      ),
    );
  }

  onProgressTracking(context) {
    return IndicatorStyle(
      width: 30,
      height: 30,
      color: Colors.white,
      iconStyle: IconStyle(
        iconData: Icons.check,
      ),
      indicator: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 0.03.wp,
              height: 0.03.wp,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: new AlwaysStoppedAnimation<Color>(purpleTheme),
              ),
            )
          ],
        ),
      ),
    );
  }

  previewImage(context, url) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          child: PhotoView(
            imageProvider: NetworkImage(url),
            maxScale: 0.5,
            minScale: 0.1,
            enableRotation: true,
          ),
        );
      },
    );
  }

  onWaitingTracking(context) {
    return IndicatorStyle(
      width: 30,
      height: 30,
      color: Colors.white,
    );
  }
}
