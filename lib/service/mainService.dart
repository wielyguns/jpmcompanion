import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jpmcompanion/apiConst.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/model/locationPrediction.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../const.dart';

class MainService extends Model {
  Future<Map<String, dynamic>> login(input) async {
    var responseJson;

    try {
      final response = await http.post("$loginApi", body: input);
      responseJson = _response(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> getNopolActive(TrackingPosition data) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'token': '$easygoToken',
    };

    if (data.listNopol == null) {
      data.listNopol = [];
    }

    var body = jsonEncode(data.toJson());
    var responseJson;
    try {
      final response = await http.post(
        "$lastPositionApi",
        headers: headers,
        body: body,
      );
      responseJson = _response(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> getKota(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var responseJson;
    try {
      final response = await http.post(
        "$getAsalApi",
        headers: {
          'Authorization': 'Bearer ${prefs.getString('token')}',
        },
        body: data,
      );
      responseJson = await _response(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> getNopol() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var responseJson;
    try {
      final response = await http.post(
        "$getNopolApi",
        headers: {
          'Authorization': 'Bearer ${prefs.getString('token')}',
        },
      );
      responseJson = await _response(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> getLocation(value) async {
    // ignore: deprecated_member_use
    Position position = await getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );

    var responseJson;
    var input = {
      "input": value,
      "key": googleApi,
      "sessiontoken": "1234567890",
      "pos": "${position.latitude},${position.longitude}",
      "languange": 'id',
      "rad": 50000,
    };

    var param =
        "?input=${input['input']}&key=${input['key']}&sessiontoken=${input['sessiontoken']}&location=${input['pos']}&radius=${input['rad']}";

    try {
      final response = await http.get(
        "https://maps.googleapis.com/maps/api/place/autocomplete/json$param",
      );
      responseJson = _response(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }

    return responseJson;
  }

  Future<Map<String, dynamic>> getLocationDetail(
      LocationPrediction value) async {
    // ignore: deprecated_member_use

    var responseJson;
    var input = {
      "place_id": value.placeId,
      "key": googleApi,
      "fields": "geometry",
    };
    var param =
        "?place_id=${input['place_id']}&fields=${input['fields']}&key=${input['key']}";
    try {
      final response = await http.get(
        "$getLocationDetailApi$param",
      );
      responseJson = _response(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }

    return responseJson;
  }

  Future<Map<String, dynamic>> geoLocation(Position data) async {
    var responseJson;

    var url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${data.latitude},${data.longitude}&key=$googleApi";
    try {
      final response = await http.get(
        "$url",
      );
      responseJson = _response(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> getTrackingDescription() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseJson;
    try {
      final response = await http.get(
        "$getTrackingDescriptionApi",
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

  Future<Map<String, dynamic>> getTrackingType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseJson;

    try {
      final response = await http.get(
        "$getTrackingTypeApi",
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
