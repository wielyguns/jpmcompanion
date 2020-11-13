import 'dart:io';
import 'package:jpmcompanion/apiConst.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ShippingOrderService extends Model {
  Future<Map<String, dynamic>> prosesShippingOrder(ShippingOrder data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseJson;
    try {
      final response = await http.post(
        "$shippingOrderApi",
        headers: {
          'Authorization': 'Bearer ${prefs.getString('token')}',
        },
        body: data.toJson(),
      );
      responseJson = await responseCheck(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> getShippingOrder(nopol) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseJson;
    var param = '?nopol=$nopol';
    try {
      final response = await http.get(
        "$shippingOrderApi$param",
        headers: {
          'Authorization': 'Bearer ${prefs.getString('token')}',
        },
      );
      responseJson = await responseCheck(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }
    return responseJson;
  }
}
