import 'package:fl_chart/fl_chart.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/model/homeModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
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
  // GETTER
  List<FlSpot> get pendapatanSpots => _pendapatanSpots;
  List<FlSpot> get deliveryOrderSpots => _deliveryOrderSpots;
  DataDashboard get dataDashboard => _dataDashboard;
  User get user => _user;
  List<String> get spotsName => _spotsName;
  init(context) async {
    setBusy(true);
    await redirectToLogin(context);
    await getDataUser(context);
    setBusy(false);
    notifyListeners();
  }

  getDataUser(context) async {
    await MainService().user().then((value) async {
      if (value['status'] == 1) {
        _user = User.fromJson(value['data']);
      } else if (value['status'] == 0) {
        // await redirectToLogin(context);
      }
    });
    notifyListeners();
  }
}
