import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../const.dart';

class DashboardViewModel extends BaseViewModel {
  // SETTER
  TextEditingController _search = TextEditingController();
  // GETTER
  TextEditingController get search => _search;
  // FUNCTION
  init(context) async {
    setBusy(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') == null) {
      return Navigator.popAndPushNamed(context, loginRoute);
    }
    setBusy(false);
    notifyListeners();
  }

  logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('id');
    Navigator.popAndPushNamed(context, loginRoute);
  }
}
