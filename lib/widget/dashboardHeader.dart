import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const.dart';

class DashboardHeader extends StatefulWidget {
  final kirimanHariIni;

  const DashboardHeader({Key key, this.kirimanHariIni}) : super(key: key);
  @override
  _DashboardHeaderState createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {
  User me;
  @override
  void initState() {
    initMe();
    super.initState();
  }

  Future initMe() async {
    if (!mounted) {
      return;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('user');
    if (temp != null) {
      setState(() {
        me = User.fromJson(jsonDecode(temp));
      });
    }
  }

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
            if (me != null)
              TextSpan(
                text: ' ${me.nama}\n\n',
                style: TextStyle(
                  color: Color(
                    hexStringToHexInt('#6F6F6F'),
                  ),
                  fontSize: 60.ssp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            TextSpan(
              text: 'Terdapat ${widget.kirimanHariIni} Kiriman',
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
              text: ' hari ini',
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
