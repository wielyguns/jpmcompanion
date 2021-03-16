import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/PickUpModel.dart';
import 'package:jpmcompanion/route.dart';
import 'package:camera/camera.dart';

import 'const.dart';

List<CameraDescription> cameras;
PickUp onProcessPickUp;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

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
