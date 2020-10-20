import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/const.dart';

class LoadingScreen extends StatefulWidget {
  final showLoadingApi;
  final showLoadingScreen;
  final child;

  const LoadingScreen({
    Key key,
    this.showLoadingApi,
    this.child,
    this.showLoadingScreen,
  }) : super(key: key);
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          IgnorePointer(
            ignoring: (widget.showLoadingScreen == true ||
                    widget.showLoadingApi == true)
                ? true
                : false,
            child: widget.child,
          ),
          Visibility(
            visible: widget.showLoadingScreen,
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Visibility(
            visible: (widget.showLoadingScreen),
            child: Container(
              child: SizedBox(
                width: 0.04.hp,
                height: 0.04.hp,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(greenTea),
                ),
              ),
            ),
          ),
          Visibility(
            visible: (widget.showLoadingApi),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: SizedBox(
                width: 0.04.hp,
                height: 0.04.hp,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(purpleLightTheme),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
