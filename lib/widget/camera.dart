import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image/image.dart' as imagePreset;
import 'package:jpmcompanion/main.dart' as main;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController _controller;
  bool _isTaking = false;
  String _imagePath;
  File _image;
  // Future<void> _initializeControllerFuture;
  @override
  void initState() {
    super.initState();
    _controller = CameraController(main.cameras[0], ResolutionPreset.medium);
    // _initializeControllerFuture = _controller.initialize();
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    if (!_controller.value.isInitialized) {
      return Container();
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        (!_isTaking)
            ? Container(
                width: 1.wp,
                height: 1.hp,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: CameraPreview(_controller),
                    ),
                    Positioned(
                      bottom: 0.05.hp,
                      child: Container(
                        child: FloatingActionButton(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          onPressed: () async {
                            try {
                              if (!mounted) {
                                return;
                              }
                              // Ensure that the camera is initialized.
                              // await _initializeControllerFuture;
                              await _controller.initialize();

                              // Construct the path where the image should be saved using the path
                              // package.

                              _imagePath = join(
                                // Store the picture in the temp directory.
                                // Find the temp directory using the `path_provider` plugin.
                                (await getTemporaryDirectory()).path,
                                '${DateTime.now()}.png',
                              );

                              // Attempt to take a picture and log where it's been saved.
                              await _controller.takePicture(_imagePath);
                              _image = File(_imagePath);
                              print(_image);
                              setState(() {
                                _isTaking = true;
                              });
                            } catch (e) {
                              // If an error occurs, log the error to the console.
                              print(e);
                            }
                          },
                          child: Icon(
                            FontAwesomeIcons.camera,
                            size: 80.ssp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                width: 1.wp,
                height: 1.hp,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Image.file(_image),
                    ),
                    Positioned(
                      bottom: 0.05.hp,
                      child: Container(
                        width: 1.wp,
                        padding: EdgeInsets.symmetric(horizontal: 0.1.wp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FloatingActionButton(
                              heroTag: "btn1",
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              onPressed: () async {
                                if (!mounted) {
                                  return;
                                }
                                setState(() {
                                  _isTaking = false;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.timesCircle,
                                size: 80.ssp,
                              ),
                            ),
                            FloatingActionButton(
                              heroTag: "btn2",
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              onPressed: () async {
                                if (!mounted) {
                                  return;
                                }

                                Navigator.of(context).pop(File(_imagePath));
                              },
                              child: Icon(
                                FontAwesomeIcons.checkCircle,
                                size: 80.ssp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
      ],
    );
  }
}
