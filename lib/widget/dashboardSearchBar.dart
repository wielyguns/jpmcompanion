import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const.dart';

class DashboardSearchBar extends StatefulWidget {
  @override
  _DashboardSearchBarState createState() => _DashboardSearchBarState();
}

class _DashboardSearchBarState extends State<DashboardSearchBar> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.04.wp),
      margin: EdgeInsets.only(
        top: 0.04.hp,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 0.1.wp,
            alignment: Alignment.center,
            child: MaterialButton(
              splashColor: purpleLightTheme,
              onPressed: () {},
              elevation: 0,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 0.01.hp,
                  ),
                  Image(
                    width: 0.08.wp,
                    image: AssetImage('assets/qrcode.png'),
                  ),
                  Text(
                    'Scan',
                    style: TextStyle(
                      fontSize: 25.ssp,
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.all(0),
              shape: CircleBorder(),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(hexStringToHexInt('#F9F9F9')),
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 2),
                  color: borderBox,
                  blurRadius: 8,
                )
              ],
            ),
            margin: EdgeInsets.only(
              left: 0.04.wp,
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: 0.7.wp,
                  child: TextField(
                    onTap: () {
                      Map data = {
                        "route": doDetailRoute,
                      };

                      Navigator.of(context).pushNamed(
                        listDoRoute,
                        arguments: data,
                      );
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Cari Delivery Order...',
                      contentPadding: EdgeInsets.only(
                        left: 0.05.wp,
                        right: 0.12.wp,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                        borderSide: BorderSide(
                          color: Color(hexStringToHexInt('#5A4CF4')),
                          width: 2.0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                      errorStyle: TextStyle(
                        height: 0,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0.04.wp,
                  child: Container(
                    width: 0.07.wp,
                    alignment: Alignment.center,
                    child: MaterialButton(
                      splashColor: purpleLightTheme,
                      onPressed: () {},
                      elevation: 0,
                      color: Colors.white,
                      child: Image(
                        width: 0.07.wp,
                        image: AssetImage(
                          'assets/magnificient.png',
                        ),
                      ),
                      padding: EdgeInsets.all(0),
                      shape: CircleBorder(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
