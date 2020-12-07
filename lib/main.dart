import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/route.dart';
import 'package:camera/camera.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'const.dart';

List<CameraDescription> cameras;
User me;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var temp = prefs.getString('user');
  if (temp != null) {
    me = User.fromJson(jsonDecode(temp));
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JPM Companion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings) => Routers.generateRoute(settings),
      initialRoute: dashboardRoute,
    );
  }
}
