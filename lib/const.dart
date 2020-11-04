//ROUTE
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

const loginRoute = '/login-route';
const dashboardRoute = '/';
const purchaseOrderRoute = '/purchase-order-route';
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

messageToast(message, color) {
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
