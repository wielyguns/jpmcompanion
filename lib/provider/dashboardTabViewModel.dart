import 'package:fl_chart/fl_chart.dart';
import 'package:jpmcompanion/model/homeModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:stacked/stacked.dart';

import '../const.dart';

class DashboardTabViewModel extends BaseViewModel {
  // SETTER
  List<FlSpot> _pendapatanSpots = [
    FlSpot(0, 0),
  ];

  List<FlSpot> _deliveryOrderSpots = [
    FlSpot(0, 0),
  ];

  DataDashboard _dataDashboard;
  List<String> _spotsName = [];
  // GETTER
  List<FlSpot> get pendapatanSpots => _pendapatanSpots;
  List<FlSpot> get deliveryOrderSpots => _deliveryOrderSpots;
  DataDashboard get dataDashboard => _dataDashboard;
  List<String> get spotsName => _spotsName;
  init(context) async {
    await redirectToLogin(context);
    await getDataDashboard(context);
    notifyListeners();
  }

  getDataDashboard(context) async {
    await MainService().getDataDashboard().then((value) async {
      if (value['status'] == 1) {
        _dataDashboard = DataDashboard.fromJson(value['data']);
        _spotsName = _dataDashboard.spotsName;
        _pendapatanSpots.add(FlSpot(
          1,
          double.parse(_dataDashboard.totalBulanLalu.toString()),
        ));
        _pendapatanSpots.add(FlSpot(
          2,
          double.parse(_dataDashboard.totalBulanIni.toString()),
        ));
        _deliveryOrderSpots.add(FlSpot(
          1,
          double.parse(_dataDashboard.jumlahBulanLalu.toString()),
        ));
        _deliveryOrderSpots.add(FlSpot(
          2,
          double.parse(_dataDashboard.jumlahBulanIni.toString()),
        ));
      } else if (value['status'] == 0) {
        // await redirectToLogin(context);
      }
    });
    notifyListeners();
  }
}
