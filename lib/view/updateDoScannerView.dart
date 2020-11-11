import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/provider/updateDoScannerViewModel.dart';
import 'package:jpmcompanion/widget/debouncer.dart';
import 'package:jpmcompanion/widget/loadingScreen.dart';
import 'package:stacked/stacked.dart';
import 'package:twitter_qr_scanner/QrScannerOverlayShape.dart';
import 'package:twitter_qr_scanner/twitter_qr_scanner.dart';
import 'package:vibration/vibration.dart';

import '../routeTransition.dart';

class UpdateDoScannerView extends StatefulWidget {
  final param;

  const UpdateDoScannerView({Key key, this.param}) : super(key: key);
  @override
  _UpdateDoScannerViewState createState() => _UpdateDoScannerViewState();
}

class _UpdateDoScannerViewState extends State<UpdateDoScannerView> {
  GlobalKey qrKey = GlobalKey();
  final debounce = Debouncer(milliseconds: 200);
  AudioPlayer audioPlayer = AudioPlayer();
  bool isScanning = false;
  QRViewController controller;
  void _onQRViewCreate(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!mounted) {
        return;
      }
      setState(() {
        isScanning = true;
        debounce.run(() async {
          if (await Vibration.hasVibrator()) {
            Vibration.vibrate();
          }
          print("QRCode: $scanData");
          play();
        });
      });
    });
  }

  play() async {
    int result = await audioPlayer.play('https://api.jpmandiri.com/paimon.mp3');
    if (result == 1) {
      setState(() {
        isScanning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => UpdateDoScannerViewModel(),
      onModelReady: (model) => model.init(context, widget.param),
      builder: (context, model, child) => LoadingScreen(
        showLoadingApi: model.isBusy,
        showLoadingScreen: false,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            key: model.scaffoldKey,
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                QRView(
                  key: qrKey,
                  overlay: QrScannerOverlayShape(
                    borderRadius: 16,
                    borderColor: Colors.white,
                    borderLength: 120,
                    borderWidth: 10,
                    cutOutSize: 250,
                  ),
                  onQRViewCreated: _onQRViewCreate,
                  data: "QR TEXT", // Showing qr code data
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 0.06.hp),
                  padding: EdgeInsets.symmetric(horizontal: 0.05.wp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 0.1.wp,
                        height: 0.1.wp,
                        decoration: BoxDecoration(
                          color: isScanning ? Colors.red : Colors.green,
                          shape: BoxShape.circle,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
