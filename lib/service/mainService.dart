import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jpmcompanion/apiConst.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/model/locationPrediction.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:async/async.dart';
import '../const.dart';

class MainService extends Model {
  Future<Map<String, dynamic>> login(input) async {
    var responseJson;

    try {
      final response = await http.post("$loginApi", body: input);
      responseJson = await responseCheck(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseJson;

    try {
      final response = await http.post(
        "$getUserApi",
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
      responseJson = await responseCheck(response);
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
      responseJson = await responseCheck(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> getCustomer(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var responseJson;
    try {
      final response = await http.post("$getCustomerApi", headers: {
        'Authorization': 'Bearer ${prefs.getString('token')}',
      }, body: {
        "param": value,
      });
      responseJson = await responseCheck(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> getSubCity(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var responseJson;
    try {
      final response = await http.post("$getKecamatanApi", headers: {
        'Authorization': 'Bearer ${prefs.getString('token')}',
      }, body: {
        "tujuan_id": '$value',
      });
      responseJson = await responseCheck(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> searchTarif(param) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseJson;

    if (param.jenisUnit == null) {
      param.jenisUnit = [];
    }

    var body = jsonEncode(param.toJson());
    try {
      final response = await http.post(
        "$searchTarifApi?jenis_do=BARU",
        headers: {
          'Authorization': 'Bearer ${prefs.getString('token')}',
          'Content-Type': 'application/json',
        },
        body: body,
      );

      responseJson = await responseCheck(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> getJenisKiriman() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseJson;
    try {
      final response = await http.get("$getJenisKirimanApi", headers: {
        'Authorization': 'Bearer ${prefs.getString('token')}',
      });
      responseJson = await responseCheck(response);
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
      responseJson = await responseCheck(response);
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
      responseJson = await responseCheck(response);
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
      responseJson = await responseCheck(response);
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
      responseJson = await responseCheck(response);
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
      responseJson = await responseCheck(response);
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
      responseJson = await responseCheck(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> updateTracking(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseJson;
    try {
      final response = await http.post(
        "$updateTrackingApi",
        headers: {
          'Authorization': 'Bearer ${prefs.getString('token')}',
        },
        body: data,
      );
      responseJson = await responseCheck(response);

      print(response.body.toString());
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> processDelivered(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String apiKey = (prefs.getString('token') ?? "");
    apiKey = "Bearer " + apiKey;
    print(apiKey);
    var responseJson;
    var dataJson;
    try {
      var uri = Uri.parse('$updateTrackingApi');
      var request = new http.MultipartRequest("POST", uri);
      request.headers['Authorization'] = apiKey;

      if (data['signature'] != null) {
        var file = File(data['signature']);

        var stream = new http.ByteStream(
          // ignore: deprecated_member_use
          DelegatingStream.typed(
            file.openRead(),
          ),
        );

        var length = await File(file.path).length();

        var multipartFile = new http.MultipartFile(
          "signature",
          stream,
          length,
          filename: file.toString(),
        );
        request.files.add(multipartFile);
      }

      if (data['foto'] != null) {
        var file = File(data['foto']);

        var stream = new http.ByteStream(
          // ignore: deprecated_member_use
          DelegatingStream.typed(
            file.openRead(),
          ),
        );

        var length = await File(file.path).length();

        var multipartFile = new http.MultipartFile(
          "foto",
          stream,
          length,
          filename: file.toString(),
        );
        request.files.add(multipartFile);
      }

      request.fields['nomor'] = data['nomor'];
      request.fields['penerima'] = data['penerima'];
      request.fields['type'] = data['type'];
      request.fields['deskripsi'] = data['deskripsi'];
      responseJson = await request.send();
      dataJson = await http.Response.fromStream(responseJson);
      debugPrint('$dataJson');
    } on SocketException {
      responseJson = {"status": 2, "message": "No Internet connection"};
    }
    debugPrint(dataJson.body.toString());
    dataJson = json.decode(dataJson.body.toString());
    return dataJson;
  }

  Future<Map<String, dynamic>> getDeliveryOrder(nomor, page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var responseJson;
    try {
      final response = await http.get(
        "$paginateDoApiRoute?page=$page&nomor=$nomor",
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

  Future<Map<String, dynamic>> detailDeliveryOrder(nomor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var responseJson;
    try {
      final response = await http.get(
        "$deliveryOrderApi/$nomor",
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

  Future<Map<String, dynamic>> saveDo(param) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseJson;

    if (param.jenisUnit == null) {
      param.jenisUnit = [];
    }

    var body = jsonEncode(param.toJson());
    try {
      final response = await http.post(
        "$saveDoApi",
        headers: {
          'Authorization': 'Bearer ${prefs.getString('token')}',
          'Content-Type': 'application/json',
        },
        body: body,
      );
      responseJson = await responseCheck(response);
    } on SocketException {
      responseJson = {"status": 502, "message": "No Internet connection"};
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> getTracking(nomor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseJson;
    var param = "?nomor=$nomor";
    try {
      final response = await http.get(
        "$getTrackingApiRoute$param",
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

  Future<Map<String, dynamic>> getDataDashboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseJson;

    try {
      final response = await http.get(
        "$getDataDashboardApi",
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
