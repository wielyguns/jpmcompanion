import 'package:flutter/material.dart';
import 'package:jpmcompanion/provider/dashboardViewModel.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
