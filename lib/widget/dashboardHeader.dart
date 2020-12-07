import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/main.dart' as main;

import '../const.dart';

class DashboardHeader extends StatefulWidget {
  @override
  _DashboardHeaderState createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      padding: EdgeInsets.only(top: 0.04.hp, right: 0.04.wp, left: 0.04.wp),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Hello,',
              style: TextStyle(
                color: Color(
                  hexStringToHexInt('#FF5373'),
                ),
                fontSize: 60.ssp,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ' ${main.me.nama}\n\n',
              style: TextStyle(
                color: Color(
                  hexStringToHexInt('#6F6F6F'),
                ),
                fontSize: 60.ssp,
                fontWeight: FontWeight.normal,
              ),
            ),
            TextSpan(
              text: 'Terdapat 5',
              style: TextStyle(
                color: Color(
                  hexStringToHexInt('#6F6F6F'),
                ),
                fontSize: 60.ssp,
                fontWeight: FontWeight.normal,
              ),
            ),
            TextSpan(
              text: ' DO',
              style: TextStyle(
                color: Color(
                  hexStringToHexInt('#5F5F5F'),
                ),
                fontSize: 60.ssp,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(
              text: ' belum terkirim',
              style: TextStyle(
                color: Color(
                  hexStringToHexInt('#6F6F6F'),
                ),
                fontSize: 60.ssp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
