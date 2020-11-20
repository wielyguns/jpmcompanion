import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/provider/updateDoScannerViewModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:jpmcompanion/widget/debouncer.dart';
import 'package:jpmcompanion/widget/loadingScreen.dart';
import 'package:stacked/stacked.dart';
import 'package:twitter_qr_scanner/QrScannerOverlayShape.dart';
import 'package:twitter_qr_scanner/twitter_qr_scanner.dart';
import 'package:vibration/vibration.dart';

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
  bool preventBackAgain = true;
  Map<String, dynamic> _data;
  QRViewController controller;

  @override
  void initState() {
    if (!mounted) {
      return;
    }
    setState(() {
      _data = widget.param;
    });
    super.initState();
  }

  void _onQRViewCreate(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!mounted) {
        return;
      }
      setState(() {
        isScanning = true;
        debounce.run(() async {
          print("QRCode: $scanData");
          _data['nomor'] = scanData.toString().replaceAll(' ', '');

          if (widget.param['callback'] == null) {
            await MainService().updateTracking(_data).then((value) {
              if (value['status'] == 1) {
                play(value['message']);
              } else {
                messageToast(value['message'], Colors.red);
              }
            });
          } else {
            if (preventBackAgain == true) {
              Vibration.vibrate();
              Navigator.of(context).pop(_data['nomor']);
              preventBackAgain = false;
            }
          }
        });
      });
    });
  }

  play(scanData) async {
    int result = await audioPlayer.play(
        'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=$scanData&tl=id&total=1&idx=0&textlen=8');
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
