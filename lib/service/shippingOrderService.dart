import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
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
      responseJson = _response(response);
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
      responseJson = _response(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
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
          var responseJson = {
            "status": 502,
            "message": "No Internet connection"
          };
          return responseJson;
      }
    } catch (e) {
      print('${response.body.toString()}');
      var responseJson = {"status": 502, "msg": "No Internet connection"};
      return responseJson;
    }
  }
}
