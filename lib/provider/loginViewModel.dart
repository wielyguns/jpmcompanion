import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';

import 'package:jpmcompanion/service/mainService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../const.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController _username = TextEditingController(text: '');
  TextEditingController _password = TextEditingController(text: '');
  String _usernameError;
  String _passwordError;
  bool _submit = false;
  bool _isLoadingApi = false;
  final _formKey = GlobalKey<FormState>();
  //GETTER
  TextEditingController get username => _username;
  TextEditingController get password => _password;
  String get usernameError => _usernameError;
  String get passwordError => _passwordError;
  bool get isLoadingApi => _isLoadingApi;
  GlobalKey get formKey => _formKey;

  init() async {
    _username.addListener(() {
      if (_submit) {
        _usernameError = null;
        _formKey.currentState.validate();
        notifyListeners();
      }
    });

    _password.addListener(() {
      if (_submit) {
        _passwordError = null;
        _formKey.currentState.validate();
        notifyListeners();
      }
    });
  }

  isError(input) {
    switch (input) {
      case 'username':
        _usernameError = 'Username harus diisi';
        notifyListeners();
        return 'error';
        break;
      case 'password':
        _passwordError = 'Password harus diisi';
        notifyListeners();
        return 'error';
        break;
      default:
        _usernameError = null;
        _passwordError = null;
    }
  }

  login(context) async {
    _submit = true;
    notifyListeners();
    if (_formKey.currentState.validate() == false) {
      var color = Colors.red;
      messageToast('Cek kembali data anda', color);
      _isLoadingApi = false;
      return;
    }
    isError('');
    _isLoadingApi = true;
    FocusScope.of(context).unfocus();
    var input = {
      "username": "${_username.text}",
      "password": "${_password.text}",
    };
    await MainService().login(input).then((value) async {
      if (value['status'] == 1) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', value['api_key'].toString());
        prefs.setString('id', value['data']['id'].toString());
        prefs.setString('user', jsonEncode(value['data']).toString());
        Navigator.of(context).pushNamedAndRemoveUntil(
          dashboardRoute,
          (route) => false,
        );
      } else {
        messageToast(value['message'], Colors.red);
      }
    });

    _isLoadingApi = false;
    notifyListeners();
  }
}
