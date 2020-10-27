import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DashboardTabViewModel extends BaseViewModel {
  // SETTER
  List<FlSpot> _pendapatanSpots = [
    FlSpot(0, 0),
    FlSpot(1, 2567895670),
    FlSpot(2, 3756970345),
  ];

  List<FlSpot> _deliveryOrderSpots = [
    FlSpot(0, 0),
    FlSpot(1, 120000.0),
    FlSpot(2, 60444),
  ];

  // GETTER
  List<FlSpot> get pendapatanSpots => _pendapatanSpots;
  List<FlSpot> get deliveryOrderSpots => _deliveryOrderSpots;
  init() {}
}
