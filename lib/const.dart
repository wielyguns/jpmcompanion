import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jpmcompanion/routeTransition.dart';
import 'package:jpmcompanion/view/loginView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

//ROUTE

const loginRoute = '/login-route';
const dashboardRoute = '/';
const purchaseOrderRoute = '/purchase-order-route';
const listKotaRoute = '/list-kota-route';
const listNopolRoute = '/list-nopol-route';
const mapSelectRoute = '/map-select-route';
const shippingOrderDetailRoute = '/shipping-order-detail-route';
const updateDoRoute = '/update-do-route';
const updateDoScannerRoute = '/update-do-scanner-route';
const trackingDoRoute = '/tracking-do-route';
const listDoRoute = '/list-do-route';
const doDetailRoute = '/do-detail-route';
// COLOR
Color greenTea = Color(hexStringToHexInt('#7bc145'));
Color borderBox = Color(hexStringToHexInt('#DEDEDE'));
Color textBlack = Color(hexStringToHexInt('#2A2A2A'));
Color textGrey = Color(hexStringToHexInt('#757575'));
Color fbColor = Color(hexStringToHexInt('#1877F2'));
Color hintColor = Color(hexStringToHexInt('#C2C2C2'));
Color titleColor = Color(hexStringToHexInt('#505050'));
Color purpleTheme = Color(hexStringToHexInt('#5A4CF4'));
Color purpleLightTheme = Color(hexStringToHexInt('#D9CBFF'));
Color purpleChart = Color(hexStringToHexInt('#9B51E0'));
final oCcy = new NumberFormat("###,###,###", "id");
// FUNCTION
hexStringToHexInt(String hex) {
  hex = hex.replaceFirst('#', '');
  hex = hex.length == 6 ? 'ff' + hex : hex;
  int val = int.parse(hex, radix: 16);
  return val;
}

messageToast(message, Color color) {
  Fluttertoast.showToast(
    msg: "$message",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

redirectToLogin(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString('token') == null) {
    Navigator.pushAndRemoveUntil(
      context,
      RouteAnimationDurationFade(
        widget: LoginView(),
      ),
      (route) => false,
    );
  }
}

dynamic responseCheck(http.Response response) async {
  try {
    switch (response.statusCode) {
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 301:
        var responseJson = {
          "status": response.statusCode,
          "message": "Api redirect error"
        };
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 401:
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('token');
        await prefs.remove('id');
        await prefs.remove('user');
        var responseJson = json.decode(response.body.toString());
        messageToast(responseJson['message'], Colors.red);
        return responseJson;
        break;
      case 404:
      case 403:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 500:
      default:
        var responseJson = {"status": 502, "message": "No Internet connection"};
        return responseJson;
    }
  } catch (e) {
    print('${response.body.toString()}');
    var responseJson = {"status": 502, "msg": "No Internet connection"};
    return responseJson;
  }
}
