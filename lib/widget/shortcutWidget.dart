import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/const.dart';

class ShortcutWidget extends StatefulWidget {
  final data;
  final bool isSet;

  const ShortcutWidget({Key key, this.data, this.isSet = false})
      : super(key: key);
  @override
  _ShortcutWidgetState createState() => _ShortcutWidgetState();
}

class _ShortcutWidgetState extends State<ShortcutWidget> {
  @override
  Widget build(BuildContext context) {
    return (widget.isSet)
        ? Container(
            width: 0.2.wp,
            child: Container(
              constraints: BoxConstraints(minHeight: 0.1.hp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(0.01.wp),
                    child: Image(
                      width: 0.1.wp,
                      image: AssetImage(
                        widget.data['icon'],
                      ),
                    ),
                  ),
                  SizedBox(height: 0.02.wp),
                  Text(
                    widget.data['title'],
                    style: TextStyle(
                      color: Color(
                        hexStringToHexInt('#736B6D'),
                      ),
                      fontWeight: FontWeight.bold,
                      fontFamily: "PlexSans",
                      fontSize: 35.ssp,
                    ),
                  ),
                  SizedBox(height: 0.01.wp),
                ],
              ),
            ),
          )
        : Container(
            width: 0.2.wp,
            child: Container(
              constraints: BoxConstraints(minHeight: 0.1.hp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(0.01.wp),
                    child: Image(
                      width: 0.15.wp,
                      image: AssetImage(
                        'assets/Asset 93300 1.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
